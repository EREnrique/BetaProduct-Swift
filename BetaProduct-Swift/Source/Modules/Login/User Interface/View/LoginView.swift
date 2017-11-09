//
//  LoginView.swift
//  BetaProduct-Swift
//
//  Created by User on 11/9/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    @IBOutlet var loginView: UIView!
    @IBOutlet weak var iDoohImageView: UIImageView!
    @IBOutlet weak var dbsImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTheme()
        populateControls()
        enableTapGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTheme() {
        self.loginView.backgroundColor = BetaProductStyle.iDoohPurple
        self.loginButton.backgroundColor = BetaProductStyle.iDoohPink
        self.forgotPasswordButton.backgroundColor = BetaProductStyle.iDoohClearColor
        self.forgotPasswordButton.titleLabel?.textColor = BetaProductStyle.iDoohLinkColor
        self.loginButton.titleLabel?.font = BetaProductStyle.iDoohButtonLabelFont
        self.forgotPasswordButton.titleLabel?.font = BetaProductStyle.iDoohButtonLinkFont
        self.emailField.font = BetaProductStyle.iDoohTextfieldFont
        self.passwordField.font = BetaProductStyle.iDoohTextfieldFont
    }

    func populateControls() {
        self.iDoohImageView.image = UIImage(named: "iDooh")
        self.dbsImageView.image = UIImage(named: "dbsPaylah")
        self.loginButton.setTitle("Login", for: .normal)
        self.forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        self.emailField.placeholder = "Enter email"
        self.passwordField.placeholder = "Enter password"
        self.emailField.text = ""
        self.passwordField.text = ""
    }
    
    func enableTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
