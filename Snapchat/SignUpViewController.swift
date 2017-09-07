//
//  SignUpViewController.swift
//  Snapchat
//
//  Created by Marius Adrian Cucu on 07/09/2017.
//  Copyright © 2017 Marius Adrian Cucu. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignUpViewController: HelpersViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var parolaTextField: UITextField!
    @IBOutlet weak var confirmareParolaTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailTextField.layer.cornerRadius = 7
        parolaTextField.layer.cornerRadius = 7
        confirmareParolaTextField.layer.cornerRadius = 7
        
        //START adaugare button de DONE pentru momentul in care am terminat de scris user si parola
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        emailTextField.inputAccessoryView = toolbar
        parolaTextField.inputAccessoryView = toolbar
        confirmareParolaTextField.inputAccessoryView = toolbar
        //SFARSIT adaugare buton DONE
        
        // Do any additional setup after loading the view.
    }
    func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func inregistrareButton(_ sender: Any) {
        if(emailTextField.text == ""){
            self.showAlertView(title: "Eroare!", message: "Nu ati introdus email-ul!")
            return;
        }
        
        if(parolaTextField.text == ""){
            self.showAlertView(title: "Eroare!", message: "Nu ati introdus parola!")
            return;
        }
        if(confirmareParolaTextField.text == ""){
            self.showAlertView(title: "Eroare!", message: "Nu ati confirmat parola!")
            return;
        }
        
        if self.parolaTextField.text != self.confirmareParolaTextField.text {
            self.showAlertView(title: "Eroare", message: "Parole diferite!")
        }
        else {
            
            //in cazul in care autentificarea esueaza din cauza faptului ca nu exista user, se creeaza unul nou
            Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.parolaTextField.text!, completion: { (user, error) in
                print("We tried to create an user")
                if error != nil {
                    print("Hey! We have an error at new user creation: \(error)")
                }
                else {
                    print("Created user succesufully!!!")
                    print("Siged in succesufully!")
                    self.performSegue(withIdentifier: "moveBackToSignIn", sender: nil)
                }
            })
        }
    }
    
    @IBAction func renuntaButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
