//
//  StoreWebClient.swift
//  BetaProduct-Swift
//
//  Created by User on 11/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import Alamofire
import CocoaLumberjack

/// class implementation for StoreWebClientProtocol. see `StoreWebClientProtocol.swift`
class StoreWebClient: StoreWebClientProtocol {
    private var completionBlock: CompletionBlock<[Any]>?
    
    // MARK: StoreWebClientProtocol
    /// Protocol implementation. see `StoreWebClientProtocol.swift`
    func GET(_ url: String, parameters: [String : Any]?, block: @escaping CompletionBlock<[Any]>) {
        completionBlock = block
        callWS(url, method: .get, parameters: parameters)
    }
    
    // TODO: PUT
    /// Protocol implementation. see `StoreWebClientProtocol.swift`
    func PUT(_ url: String, parameters: [String : Any]?, block: @escaping CompletionBlock<[Any]>) {
        completionBlock = block
        callWS(url, method: .put, parameters: parameters)
    }
    
    // TODO: POST
    /// Protocol implementation. see `StoreWebClientProtocol.swift` 
    func POST(_ url: String, parameters: [String : Any]?, block: @escaping CompletionBlock<[Any]>) {
        completionBlock = block
        callWS(url, method: .post, parameters: parameters)
    }
    
    // TODO: DELETE
    /// Protocol implementation. see `StoreWebClientProtocol.swift`
    func DELETE(_ url: String, parameters: [String : Any]?, block: @escaping CompletionBlock<[Any]>) {
        completionBlock = block
        callWS(url, method: .delete, parameters: parameters)
    }
    
    /// Protocol implementation. see `StoreWebClientProtocol.swift`
    func UploadImage(asData data: Data, toURL url: String, WithCompletionBlock block: @escaping CompletionBlock<[Any]>) {
        completionBlock = block
        print("CALL URL: \(url)")
        Alamofire.upload(data, to: url).responseJSON { response in
            if let rawdata = response.data, let processeddata = String(data: rawdata, encoding: .utf8) {
                print(processeddata)
            }
            self.handleResponse(response)
        }
    }
    
    // MARK: Privates
    
    /**
     calls webservice via Alamofire
     - Parameters:
         - url: url target
         - method: HTTP Method
         - parameters: Parameters attached, in Dictionary format [String: Any]
         - block: completion closure. Follows Response Class
     */
    private func callWS(_ url: String, method: HTTPMethod, parameters: [String : Any]?) {
        print("CALL URL: \(url) with parameters: \(String(describing: parameters))")
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            if let rawdata = response.data, let processeddata = String(data: rawdata, encoding: .utf8) {
                print(processeddata)
            }
            self.handleResponse(response)
        }
    }
    
    /**
     handle responses received from Alamofire requests and binds them completion blocks
     - Parameters:
        - response: response input from Alamofire's construct
     */
    private func handleResponse(_ response: (DataResponse<Any>)) {
        switch response.result {
        case .success(let value):
            if let result = value as? [Any] {
                completionBlock?(.success(result))
            } else if let result = value as? [String: Any] {
                completionBlock?(.success([result]))
            } else {
                completionBlock?(.success(nil))
            }
        case .failure(let error):
            let caughtError = BPError.init(domain: BetaProduct.kBPErrorDomain,
                                           code: .WebService,
                                           description: BetaProduct.kBPGenericError,
                                           reason: error.localizedDescription,
                                           suggestion: "Debug function \(#function)")
            caughtError.innerError = error
            DDLogError("Error  description : \(caughtError.localizedDescription) reason : \(caughtError.localizedFailureReason ?? "Unknown Reason") suggestion : \(caughtError.localizedRecoverySuggestion ?? "Unknown Suggestion")")
            completionBlock?(.failure(caughtError))
        }
    }
}
