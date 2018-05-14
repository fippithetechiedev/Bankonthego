//
//  signinViewController.swift
//  bankonthego
//
//  Created by Philip George on 29/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
import FirebaseDatabase
var bal = ""
var account = ""
class signinViewController: UIViewController {

    @IBOutlet weak var acc: UITextField!
    @IBOutlet weak var pass: UITextField!
    var password = ""
    var name = ""
    
    
    @IBAction func accno(_ sender: Any) {
        check()
        account = acc.text!
        checkref = Database.database().reference().child(acc.text!)
        checkref.queryOrdered(byChild: "PASS").observe(.value, with:
            { snapshot in
            
                if snapshot.exists()
                {
                let value = snapshot.value as? NSDictionary
                    self.password = value?["PASS"] as? String ?? ""
                    print(self.password)
                    
                self.name = value?["NAME"] as? String ?? ""
                //var a = value?["CREDIT"]
                bal = value?["CREDIT"] as? String ?? ""
                print(bal)
                    
                //print(value?["CREDIT"] as? Double ?? "")

                    
        
                }
                else
                {
                    
                    print("does not exist")
                    self.showerror(title: "ERROR", message: "ACCOUNT DOES NOT EXIST!")
                }
                
                })
    
    }
    
    
    
    
    @IBAction func password(_ sender: Any) {
        check()
    }
    
    @IBOutlet weak var go: UIButton!
    @IBAction func gopressed(_ sender: Any) {
        if pass.text == password
        {
            
            showpass(title: "WELCOME", message: "HELLO \(name)!")
            
            
        }
        else
        {
        
            showerror(title: "ERROR", message: "WRONG PASSWORD")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //var accno:String = ""
        //var password:String = ""

       
        acc.autocorrectionType = UITextAutocorrectionType.no
        
        pass.autocorrectionType = UITextAutocorrectionType.no
acc.returnKeyType = UIReturnKeyType.done
pass.returnKeyType = UIReturnKeyType.done
 go.layer.cornerRadius = 10
        go.isUserInteractionEnabled = false
        go.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func showpass(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "signintomenu", sender: self)
            //self.performSegue(withIdentifier: "signintomenu", sender: self)
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    
    
    func showerror(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            //self.performSegue(withIdentifier: "signintomenu", sender: self)
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }


    
    func check()
    {
        
        if acc.text?.isEmpty == true || pass.text?.isEmpty == true
        {
            print("one/both field(s) empty")
            
            go.isUserInteractionEnabled = false
            go.backgroundColor = UIColor.gray
        }
            
        else if acc.text?.isEmpty == false && pass.text?.isEmpty == false
        {
            go.isUserInteractionEnabled = true
            go.backgroundColor = UIColor.black
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
