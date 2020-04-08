//
//  RegisterPasswordController.swift
//  kirana
//
//  Created by ENFINY INNOVATIONS on 4/8/20.
//  Copyright © 2020 ENFINY INNOVATIONS. All rights reserved.
//

import UIKit
import MaterialComponents


class RegisterPasswordController: UIViewController {
    
    var  passwordFieldMDC: MDCTextInputControllerOutlined = MDCTextInputControllerOutlined()
    var nextButton = Button(bgColor: .white, title: "Get Started", titleColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "back "), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonPress), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var letsGetLabel: UILabel = {
       let label = UILabel()
//        label.text = "Let's get started..."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    @objc func backButtonPress() {
        print("i am pressed")
        navigationController?.popViewController(animated: true)
    }
    
    lazy var passwordField: UITextField = {
        let field = MDCTextField()
        field.placeholder = "Password"

        field.font =  UIFont.systemFont(ofSize: 17)
        field.textColor = .white
        passwordFieldMDC = MDCTextInputControllerOutlined(textInput: field)
        
        self.passwordFieldMDC.floatingPlaceholderNormalColor = .white
        self.passwordFieldMDC.activeColor = .white
        self.passwordFieldMDC.leadingUnderlineLabelTextColor = .white
        self.passwordFieldMDC.floatingPlaceholderActiveColor = .white
        self.passwordFieldMDC.floatingPlaceholderScale = 1.3
        self.passwordFieldMDC.inlinePlaceholderFont = UIFont.systemFont(ofSize: 13)
        self.passwordFieldMDC.inlinePlaceholderColor = .white
        self.passwordFieldMDC.borderStrokeColor = .white
        
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        view.setGradientBackgroundColor(colorOne: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), colorTwo:  #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        configureBackButton()
        configureLetsGetLabel()
        configurePasswordField()
        configureNextButton()
        
        let nameVC = RegisterNameController()
        nameVC.registerDelegate = self
        
    }
    
    func configureBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    func configureLetsGetLabel() {
        view.addSubview(letsGetLabel)
        letsGetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            letsGetLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
            letsGetLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    func configurePasswordField() {
        view.addSubview(passwordField)
        passwordField.delegate = self
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: letsGetLabel.bottomAnchor, constant: 60),
            passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 130),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
    }
    @objc func nextButtonTap() {
        
//        navigationController?.pushViewController(RegisterPasswordController(), animated: true)
    }
}

extension RegisterPasswordController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
    
          return true
      }
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("end")
       
    }
}

extension RegisterPasswordController: NameDataDelegate {
    func getName(firstN: String, lastN: String) {
        print(firstN + lastN)
        letsGetLabel.text = "Hello \(firstN), let's secure \n your account"
    }
    
    
}


