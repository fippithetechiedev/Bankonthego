//
//  playgroundViewController.swift
//  bankonthego
//
//  Created by Philip George on 29/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
import FirebaseDatabase

class playgroundViewController: UIViewController {
    
    var ci = 0

    @IBAction func gopressed(_ sender: Any) {
        
        if choice == "WITHDRAW"
        {
            withdraw()
        }
        
    }
    @IBAction func BACK(_ sender: Any) {
        performSegue(withIdentifier: "playgroundtomenu", sender: self)
    }
    
    @IBOutlet weak var go: UIButton!
    
    @IBOutlet weak var principle: UITextField!
    
    @IBOutlet weak var rate: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    @IBOutlet weak var maintitle: UILabel!
    
    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var balance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        go.layer.cornerRadius = 10
        principle.isHidden = true
        rate.isHidden = true
        time.isHidden = true
        principle.isUserInteractionEnabled = false
        rate.isUserInteractionEnabled = false
        time.isUserInteractionEnabled = false
        amount.isHidden = true
        amount.isUserInteractionEnabled = false
        balance.isHidden = true
        go.isHidden = true
        go.isUserInteractionEnabled = false

        
        maintitle.text = choice
        if choice == "SI"
        {
            principle.isHidden = false
            rate.isHidden = false
            time.isHidden = false
            principle.isUserInteractionEnabled = true
            rate.isUserInteractionEnabled = true
            time.isUserInteractionEnabled = true
            
            go.isHidden = false
            go.isUserInteractionEnabled = true

        }
        else if choice == "CI"
        {
            
            principle.isHidden = false
            rate.isHidden = false
            time.isHidden = false
            principle.isUserInteractionEnabled = true
            rate.isUserInteractionEnabled = true
            time.isUserInteractionEnabled = true
            go.isHidden = false
            go.isUserInteractionEnabled = true
        }
        else if choice == "WITHDRAW"
        {

            amount.isUserInteractionEnabled = true
            amount.isHidden = false
            balance.isHidden = false
            go.isHidden = false
            go.isUserInteractionEnabled = true
            print(bal)
            balance.text = "₹\(bal)"
            
            
        }

        else if choice == "DEPOSIT"
        {

            amount.isUserInteractionEnabled = true
            amount.isHidden = false
            balance.isHidden = false
            go.isHidden = false
            go.isUserInteractionEnabled = true
        }

        else if choice == "BALANCE"
        {
            balance.isHidden = false
            go.isHidden = true
            go.isUserInteractionEnabled = false
        }
        
        

        // Do any additional setup after loading the view.
    }

    
    func CI()
    {
       // var p:Int? = principle.text.
     
     //var r = Int(rate.text!)
     //var t = Int(time.text!)
     
    
    }
    
    func withdraw()
    {
        var cash = 0
        var bala = (bal as NSString).integerValue
        cash = (amount.text! as NSString).integerValue
    
        bala = bala - cash
        print(bala)
        ref.child(account).child("CREDIT").setValue(bala)
        
    }
    
    func deposit()
    {
        
    }
    
    func showbalance()
    {
        balance.text = bal
        
        
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
