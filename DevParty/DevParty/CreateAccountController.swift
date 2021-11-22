//
//  CreateAccountController.swift
//  DevParty
//
//  Created by John McCants on 11/18/21.
//

import UIKit

class CreateAccountController: UIViewController {

  @IBOutlet weak var firstNameText: UITextField!
  
  @IBOutlet weak var lastNameText: UITextField!
  
  @IBOutlet weak var emailText: UITextField!
  
  @IBOutlet weak var passwordText: UITextField!
  
  @IBOutlet weak var confirmPasswordText: UITextField!
  
  @IBOutlet weak var nextButton: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
  }
  
  @IBAction func nextButtonTapped(_ sender: Any) {
  }
  
  func updateViews() {
    self.nextButton.isEnabled = false
    self.firstNameText.becomeFirstResponder()
    self.hideKeyboardWhenTappedAround()
    self.firstNameText.delegate = self
    self.lastNameText.delegate = self
    self.emailText.delegate = self
    self.passwordText.delegate = self
    self.confirmPasswordText.delegate = self

  }
  
  func checkTextFields() {
    guard let firstName = self.firstNameText.text, firstName.count >= 2 else { self.nextButton.isEnabled = false
      return
    }
    guard let lastName = self.lastNameText.text, lastName.count >= 2 else { self.nextButton.isEnabled = false
      return
    }
//    guard let emailText = self.emailText.text, emailText.text.count >= 2 else { return }
    guard let passwordText = self.passwordText.text, passwordText.count >= 2 else { self.nextButton.isEnabled = false
      return
    }
    guard let confirmPasswordText = self.confirmPasswordText.text, confirmPasswordText.count >= 2 else { self.nextButton.isEnabled = false
      return
    }
    
    if passwordText == confirmPasswordText {
      self.nextButton.isEnabled = true
    } else {
      self.nextButton.isEnabled = false
    }
  }
}

extension CreateAccountController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if let textFieldText = textField.text {
      
      switch textField {
      case self.firstNameText:
        return textFieldText.count + (string.count - range.length) <= 20
      case self.lastNameText:
        return textFieldText.count + (string.count - range.length) <= 20
      case self.emailText:
        return textFieldText.count + (string.count - range.length) <= 32
      case self.passwordText:
        return textFieldText.count + (string.count - range.length) <= 32
      case self.confirmPasswordText:
        return textFieldText.count + (string.count - range.length) <= 32
      default:
        break
      }
    }
    return false
  }
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    print("changing")
    checkTextFields()
  }
  func textFieldDidBeginEditing(_ textField: UITextField) {
    checkTextFields()
  }
}
