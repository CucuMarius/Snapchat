//
//  SignViewController.swift
//  Snapchat
//
//  Created by Marius Adrian Cucu on 06/09/2017.
//  Copyright © 2017 Marius Adrian Cucu. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: HelpersViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.layer.cornerRadius = 7
        passwordTextField.layer.cornerRadius = 7
        
        
        //START adaugare button de DONE pentru momentul in care am terminat de scris user si parola
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        usernameTextField.inputAccessoryView = toolbar
        passwordTextField.inputAccessoryView = toolbar
        //SFARSIT adaugare buton DONE
    }
    
    func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func turnUpButton(_ sender: Any) {
        //START adaugare mesaje de eroare in cazul in care campurile pentru user si parola nu au fost completate
        if(usernameTextField.text == ""){
            self.showAlertView(title: "Eroare!", message: "Nu ati introdus username-ul!")
            return;
        }
        
        if(passwordTextField.text == ""){
            self.showAlertView(title: "Eroare!", message: "Nu ati introdus parola!")
            return;
        }
        //SFARSIT adaugare mesaje de eroare in cazul in care campurile pentru user si parola nu au fost finalizate
        
        //din FIREBASE am setat ca login-ul sa sa realizeze cu username si parola. In continuare scriem cod aferent acestui lucru
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in!")
            if error != nil{
                print("Hey! We have an error: \(error)")
            }
            else {
                print("Siged in succesufully!")
            }
        }
    }
    
    
}

