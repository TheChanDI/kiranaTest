//
//  RegisterNameController.swift
//  kirana
//
//  Created by ENFINY INNOVATIONS on 4/7/20.
//  Copyright © 2020 ENFINY INNOVATIONS. All rights reserved.
//

import UIKit
import MaterialComponents

protocol NameDataDelegate {
    func getName(firstN: String, lastN: String)
}


class RegisterNameController: UIViewController {
    
    var  firstNameMDC: MDCTextInputControllerOutlined = MDCTextInputControllerOutlined()
    var  lastNameMDC: MDCTextInputControllerOutlined = MDCTextInputControllerOutlined()
    var nextButton = Button(bgColor: .white, title: "Next", titleColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var registerDelegate: NameDataDelegate!
    
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
        label.text = "Let's get started..."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    @objc func backButtonPress() {
        print("i am pressed")
   
        navigationController?.popViewController(animated: true)
    }
    
    lazy var firstNameField: UITextField = {
        let field = MDCTextField()
        field.placeholder = "First Name"

        field.font =  UIFont.systemFont(ofSize: 17)
        field.textColor = .white
        firstNameMDC = MDCTextInputControllerOutlined(textInput: field)
        
        self.firstNameMDC.floatingPlaceholderNormalColor = .white
        self.firstNameMDC.activeColor = .white
        self.firstNameMDC.leadingUnderlineLabelTextColor = .white
        self.firstNameMDC.floatingPlaceholderActiveColor = .white
        self.firstNameMDC.floatingPlaceholderScale = 1.3
        self.firstNameMDC.inlinePlaceholderFont = UIFont.systemFont(ofSize: 13)
        self.firstNameMDC.inlinePlaceholderColor = .white
        self.firstNameMDC.borderStrokeColor = .white
        
        return field
    }()
    
    lazy var lastNameField: UITextField = {
        let field = MDCTextField()
        field.placeholder = "Last Name"
        
        field.font =  UIFont.systemFont(ofSize: 17)
        field.textColor = .white
        lastNameMDC = MDCTextInputControllerOutlined(textInput: field)
        
        self.lastNameMDC.floatingPlaceholderNormalColor = .white
        self.lastNameMDC.activeColor = .white
        self.lastNameMDC.leadingUnderlineLabelTextColor = .white
        self.lastNameMDC.floatingPlaceholderActiveColor = .white
        self.lastNameMDC.floatingPlaceholderScale = 1.3
        self.lastNameMDC.inlinePlaceholderFont = UIFont.systemFont(ofSize: 13)
        self.lastNameMDC.inlinePlaceholderColor = .white
        self.lastNameMDC.borderStrokeColor = .white
        
        return field
       
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
            NotificationCenter.default.removeObserver(self)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
 
        view.setGradientBackgroundColor(colorOne: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), colorTwo:  #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        configureBackButton()
        configureLetsGetLabel()
        configureFirstNameField()
        configureLastNameField()
        configureNextButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        UIView.animate(withDuration: 0.3) {
              let movement:CGFloat = 100
              self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
                      print( self.view.frame)
         }
    }
    
    @objc func showKeyboard() {
        UIView.animate(withDuration: 0.3) {
              let movement:CGFloat = -100
              self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
                      print( self.view.frame)
         }
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
    
    func configureFirstNameField() {
        view.addSubview(firstNameField)
        firstNameField.delegate = self
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstNameField.topAnchor.constraint(equalTo: letsGetLabel.bottomAnchor, constant: 60),
            firstNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            firstNameField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureLastNameField() {
        view.addSubview(lastNameField)
        lastNameField.delegate = self
         lastNameField.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 40),
             lastNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
             lastNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
             lastNameField.heightAnchor.constraint(equalToConstant: 40)
         ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
    }
    @objc func nextButtonTap() {
        registerDelegate.getName(firstN: "firstName", lastN: "secondName")
        navigationController?.pushViewController(RegisterPasswordController(), animated: true)
    }
}



extension RegisterNameController: UITextFieldDelegate {
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




