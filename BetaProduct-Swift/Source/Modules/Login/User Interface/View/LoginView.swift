//
//  LoginView.swift
//  BetaProduct-Swift
//
//  Created by User on 11/9/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class LoginView: BaseView, BaseViewProtocol, LoginViewProtocol {
    @IBOutlet var loginView: UIView!
    @IBOutlet weak var loginHeaderLabel: BetaProductHeaderLabel!
    @IBOutlet weak var loginInstructionsLabel: BetaProductInstructionLabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var eventHandler : LogInPresenter?

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
    
    func enableTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: LoginViewProtocol
    func displayMessage(_ message: String, isSuccessful: Bool) {
        let baseMessageView = BaseMessageView()
        baseMessageView.displayMessage(withTitle: "Login", messageContent: message, negativeButtonCaption: "Cancel", affirmativeButtonCaption: "OK", currentViewController: self)
        
        guard isSuccessful else {
            return
        }
        
        eventHandler?.proceedToHomeView()
    }
    
    @IBAction func login(_ sender: Any) {
        let user = UserDisplayItem.init(username: emailField.text, password: passwordField.text)
        eventHandler?.validateUser(user)
    }
}

extension LoginView {
    func setupTheme() {
        BetaProductTheme.current.apply()
        self.loginButton.applyPrimaryButtonTheme()
        self.forgotPasswordButton.backgroundColor = BetaProductStyle.iDoohClearBackground
        self.forgotPasswordButton.setTitleColor(BetaProductStyle.iDoohLinkColor, for: .normal)
        //        self.emailField.layer.cornerRadius = 5.0
        //        emailField.layer.cornerRadius = 15.0
        //        emailField.layer.borderWidth = 2.0
        //        emailField.layer.borderColor = UIColor.red.cgColor
        //        self.passwordField.layer.cornerRadius = 5.0
    }
    
    func populateControls() {
        //        self.iDoohImageView.image = UIImage(named: "iDooh")
        //        self.dbsImageView.image = UIImage(named: "dbsPaylah")
        self.loginButton.setTitle("Login", for: .normal)
        self.forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        self.emailField.placeholder = "Enter email"
        self.passwordField.placeholder = "Enter password"
        self.emailField.text = ""
        self.passwordField.text = ""
    }
}
