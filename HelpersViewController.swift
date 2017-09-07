//
//  HelpersViewController.swift
//  Snapchat
//
//  Created by Marius Adrian Cucu on 07/09/2017.
//  Copyright © 2017 Marius Adrian Cucu. All rights reserved.
//

import UIKit

class HelpersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showAlertView(title : String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }


}
