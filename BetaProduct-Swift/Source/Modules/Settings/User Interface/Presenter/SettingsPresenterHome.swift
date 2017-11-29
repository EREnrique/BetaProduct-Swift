//
//  SettingsPresenterHome.swift
//  BetaProduct-Swift DEV
//
//  Created by User on 11/28/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

/// presenter class for module "Settings"
class SettingsPresenterHome: NSObject, SettingsHomeModuleProtocol, SettingsHomeInteractorOuput {
    /// variable for interactor
    var interactor: SettingsInteractorInput?
    /// variable for wireframe
    var wireframe: String?
    /// variablw for view
    var view: String?
    
    // MARK: SettingsHomeModuleProtocol
    /// implements protocol. see `SettingsInteractorIO.swift`
    func proceedToProfileSettings() {
        
    }
    
    /// implements protocol. see `SettingsInteractorIO.swift`
    func proceedToPaswordSettings() {
        
    }
    
    /// implements protocol. see `SettingsInteractorIO.swift`
    func proceedToEmailSettings() {
        
    }
    
    /// implements protocol. see `SettingsInteractorIO.swift`
    func logout() {
        self.interactor?.logOut()
    }
    
    // MARK: SettingsHomeInteractorOuput
    /// implements protocol. see `SettingsModuleProtocols.swift`
    func logOutReady() {
        
    }
    
    /// implements protocol. see `SettingsModuleProtocols.swift`
    func gotDisplayItem<T>(_ item: T) where T : SettingsDisplayItemProtocol {
        
    }
}