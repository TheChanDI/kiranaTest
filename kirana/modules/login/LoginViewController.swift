//
//  LoginViewController.swift
//  kirana
//
//  Created by ENFINY INNOVATIONS on 4/7/20.
//  Copyright © 2020 ENFINY INNOVATIONS. All rights reserved.
//

import UIKit
import RAGTextField
import MaterialComponents

//class lineView: UnderlineView

class LoginViewController: UIViewController {
    
    var  mobileMDC: MDCTextInputControllerOutlined = MDCTextInputControllerOutlined()
    var passwordMDC: MDCTextInputControllerOutlined = MDCTextInputControllerOutlined()
    
    var signInButton = Button(bgColor: .white, title: "Sign In", titleColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    
    lazy var mobileField: UITextField = {
       let field = MDCTextField()
        field.placeholder = "Mobile number"
        
        field.font =  UIFont.systemFont(ofSize: 17)
        field.textColor = .white
        mobileMDC = MDCTextInputControllerOutlined(textInput: field)
        
        self.mobileMDC.floatingPlaceholderNormalColor = .white
        self.mobileMDC.activeColor = .white
        self.mobileMDC.leadingUnderlineLabelTextColor = .white
        self.mobileMDC.floatingPlaceholderActiveColor = .white
        self.mobileMDC.floatingPlaceholderScale = 1.3
        self.mobileMDC.inlinePlaceholderFont = UIFont.systemFont(ofSize: 13)
        self.mobileMDC.inlinePlaceholderColor = .white
        self.mobileMDC.borderStrokeColor = .white

        return field
    }()
    
    
    lazy var passwordField: UITextField = {
       let field = MDCTextField()
        field.placeholder = "password"
        field.font =  UIFont.systemFont(ofSize: 17)
        field.textColor = .white
        passwordMDC = MDCTextInputControllerOutlined(textInput: field)
        self.mobileMDC.floatingPlaceholderNormalColor = .white
        self.passwordMDC.activeColor = .white
        self.passwordMDC.floatingPlaceholderActiveColor = .white
        self.passwordMDC.floatingPlaceholderScale = 1.3
        self.passwordMDC.inlinePlaceholderFont = UIFont.systemFont(ofSize: 13)
        self.passwordMDC.inlinePlaceholderColor = .white
        self.passwordMDC.borderStrokeColor = .white
        return field
    }()
    
    lazy var forgotPwButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        let label = UILabel()
        label.text = "Don't have an account yet? "
        label.textColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(registerTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        sv.addArrangedSubview(label)
        sv.addArrangedSubview(button)
        
        return sv
    }()
    
    @objc func registerTap() {

        navigationController?.pushViewController(    RegisterNameController(), animated: true)
    }
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip for now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.setGradientBackgroundColor(colorOne: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), colorTwo:  #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        mobileField.delegate = self
        passwordField.delegate = self
        print( self.view.frame)
   
        configureMobileField()
        configurePasswordField()
        configureForgotButton()
        configureSignInButton()
        configureStackView()
        configureSkipButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
 
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          NotificationCenter.default.removeObserver(self)
    }
//    deinit {
//           NotificationCenter.default.removeObserver(self)
//       }
 
    
    @objc func keyboardWillShow() {
        print("show...")
        UIView.animate(withDuration: 0.3) {
             let movement:CGFloat = -100
             self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
                     print( self.view.frame)
        }

    }

    @objc func keyboardWillHide() {
         print("hide...")
        UIView.animate(withDuration: 0.3) {
            let movement:CGFloat = 100
            self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
                     print( self.view.frame)
    
        }

    }

    
    
    func configureMobileField() {
        view.addSubview(mobileField)
        mobileField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mobileField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mobileField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            mobileField.heightAnchor.constraint(equalToConstant: 40),
            mobileField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configurePasswordField() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: mobileField.bottomAnchor, constant: 40),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureForgotButton() {
        view.addSubview(forgotPwButton)
        forgotPwButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPwButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            forgotPwButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPwButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40)
        ])
    }
    
    func configureSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: forgotPwButton.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    
    @objc func signInTap() {
        print("ran")
    
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureSkipButton() {
        view.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        keyboardWillHide()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


    
}



