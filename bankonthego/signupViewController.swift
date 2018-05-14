//
//  signupViewController.swift
//  bankonthego
//
//  Created by Philip George on 29/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit

import FirebaseDatabase
//import SinchVerification
//var verification:Verification!;

//var applicationKey = "f23806b2-a5df-4eaf-9bce-b561c5b7c5c1";
var ref:DatabaseReference!
var checkref:DatabaseReference!
var credit = "10000"
var pass:String = ""
class signupViewController: UIViewController {


    
    
    @IBAction func accno(_ sender: Any) {
    }
    
    @IBOutlet weak var acc: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var go: UIButton!
    
    @IBAction func gopressed(_ sender: Any) {
        
        pass = acc.text!+String(arc4random_uniform(1000))
        
        let Num:String = ("+91")+(number.text!)
        //verification = SMSVerification(applicationKey, phoneNumber: Num)
        //createalert(title: "Proceed?", message: "The number entered is \(Num)")
        
        //verification.initiate { (result: InitiationResult, error:Error?) -> Void in
            
            //if (true){
            //    Swift.print("SMS SENT!")
                
            //}
//}
        

       //let key = self.ref.childByAutoId().key
        
        //self.ref.setValue([key: name.text! as NSString])
        
        //self.ref.child(acc.text!).setValue(name.text! as NSString)
        ref.child(acc.text!).child("NAME").setValue(name.text)
        ref.child(acc.text!).child("PASS").setValue(pass)
        ref.child(acc.text!).child("CREDIT").setValue(credit)
    ref.child(acc.text!).child("NUMBER").setValue(Num)
        
        showpass(title: "Sign Up Successful. Your account has been credited with ₹ 10000", message: "Your LOGIN password is \(pass). ")
        
        
        UserDefaults.standard.set(acc.text, forKey: "accountno")
        UserDefaults.standard.set(pass, forKey: "password")
        UserDefaults.standard.set("true", forKey: "signup")
        
        //print(ref.childByAutoId().key)
        
        
        
        //self.ref.child("BANK").setValue([pass: acc.text! as NSString ])
        
        //self.ref.child("BANK").child("ACCNO").child(pass).setValue([name.text! as NSString ])
        
        
        print(pass)
        
    }
    
    @IBAction func namedone(_ sender: Any) {
    check()
    name.text = name.text?.capitalized
    }
    
    @IBAction func numberdone(_ sender: Any) {
        check()
        number.text = number.text?.capitalized

    }
    
    
    func check()
    {
        
        if name.text?.isEmpty == true || number.text?.isEmpty == true
        {
            print("one/both field(s) empty")
            
            go.isUserInteractionEnabled = false
            go.backgroundColor = UIColor.gray
        }
        
        else if name.text?.isEmpty == false && number.text?.isEmpty == false
        {
            go.isUserInteractionEnabled = true
            go.backgroundColor = UIColor.black
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acc.returnKeyType = UIReturnKeyType.done
        acc.autocorrectionType = UITextAutocorrectionType.no
        ref = Database.database().reference()

        name.autocorrectionType = UITextAutocorrectionType.no
        number.autocorrectionType = UITextAutocorrectionType.no
        go.isUserInteractionEnabled = false
        go.backgroundColor = UIColor.gray
        go.layer.cornerRadius = 10
        name.returnKeyType = UIReturnKeyType.done
        number.returnKeyType = UIReturnKeyType.done
        number.keyboardType = UIKeyboardType.numbersAndPunctuation
        

        // Do any additional setup after loading the view.
    }

    
    
    func showpass(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "signuptomenu", sender: self)
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
