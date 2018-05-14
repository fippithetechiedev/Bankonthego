//
//  ViewController.swift
//  bankonthego
//
//  Created by Philip George on 29/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
var signup = "false"
class ViewController: UIViewController {
   
    
override func viewDidLoad() {
        super.viewDidLoad()

        

        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "signup") as?String
        {
            
            signup = x
            //print(x)
            
        }
        
        if signup == "true"
        {
            print("yo")
            performSegue(withIdentifier: "maintosignin", sender: self)
            //performSegue(withIdentifier: "main", sender: self)
            
        }
            
        else if signup == "false"
        {
            performSegue(withIdentifier: "maintosignup", sender: self)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

