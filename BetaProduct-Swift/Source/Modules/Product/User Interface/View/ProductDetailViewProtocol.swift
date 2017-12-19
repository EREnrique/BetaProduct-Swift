//
//  ProductDetailViewProtocol.swift
//  BetaProduct-Swift DEV
//
//  Created by User on 12/18/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

protocol ProductDetailViewProtocol {
    func fetchProductDetail(ofItemIndexAt itemIndex: Int)
    func displayProductInformation(productItem: ProductDetailItem)
}