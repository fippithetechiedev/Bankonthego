//
//  menuViewController.swift
//  bankonthego
//
//  Created by Philip George on 29/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
var choice:String = ""

class menuViewController: UIViewController {

    @IBAction func sipressed(_ sender: Any) {
        choice = "SI"
        performSegue(withIdentifier: "menutoplayground", sender: self)
    }
    
    @IBAction func cipressed(_ sender: Any) {
    choice = "CI"
    performSegue(withIdentifier: "menutoplayground", sender: self)
    }
    
    @IBAction func depositpressed(_ sender: Any) {
    choice = "DEPOSIT"
    performSegue(withIdentifier: "menutoplayground", sender: self)
    }
    
    @IBAction func balancepressed(_ sender: Any) {
    choice = "BALANCE"
    performSegue(withIdentifier: "menutoplayground", sender: self)
    }
    
    @IBAction func withdrawpressed(_ sender: Any) {
    choice = "WITHDRAW"
    performSegue(withIdentifier: "menutoplayground", sender: self)
    }

    @IBOutlet weak var si: UIButton!
    
    
    @IBOutlet weak var ci: UIButton!
    
    
    @IBOutlet weak var money: UIButton!
    
    
    @IBOutlet weak var wmoney: UIButton!
    
    @IBOutlet weak var info: UIButton!
    
    @IBOutlet weak var menu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.layer.cornerRadius = 10
        si.layer.cornerRadius = 10
        ci.layer.cornerRadius = 10
        money.layer.cornerRadius = 10
        wmoney.layer.cornerRadius = 10
        info.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
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
