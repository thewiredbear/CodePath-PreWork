//
//  ViewController.swift
//  tips
//
//  Created by Parth Bhardwaj on 12/13/15.
//  Copyright © 2015 Parth Bhardwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var body: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEdit(sender: AnyObject) {
        if let billAmount=Double((billField?.text)!){
        let tipPercentages=[0.18,0.2,0.25]
        let tipPercetange=tipPercentages[tipControl.selectedSegmentIndex]
        print("User changed the input \(tipPercetange)")
        let tip=billAmount*tipPercentages[tipControl.selectedSegmentIndex]
        let total=billAmount+tip
        tipLabel.text=String(format: "$ %.2f", tip)
        totalLabel.text=String(format: "$ %.2f", total)
        UIView.animateWithDuration(0.4, animations: {
            self.endLabel.hidden=false
            self.totalLabel.hidden=false
            self.endLabel.alpha=1
            self.totalLabel.alpha=1
            self.tipLabel.alpha=1
        })
        }
        else{
            UIView.animateWithDuration(0.4, animations: {
                self.endLabel.hidden=true
                self.totalLabel.hidden=true
                self.endLabel.alpha=0
                self.totalLabel.alpha=0
                self.tipLabel.alpha=0
            })
        }
    }
    var check=0
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        self.endLabel.hidden=true
        self.totalLabel.hidden=true
        self.endLabel.alpha=0
        self.totalLabel.alpha=0
        self.tipLabel.alpha=0
        print(self.body.backgroundColor)
    }
    var numMain=0
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        if check==1{
            if let billAmount=Double((billField?.text)!){
                let defaults = NSUserDefaults.standardUserDefaults()
                let intValue = defaults.doubleForKey("key")
                tipControl.selectedSegmentIndex=defaults.integerForKey("key2")
                print("User changed the input \(intValue)")
                let tip=billAmount*intValue
                let total=billAmount+tip
                tipLabel.text=String(format: "$ %.2f", tip)
                totalLabel.text=String(format: "$ %.2f", total)
                UIView.animateWithDuration(0.4, animations: {
                    self.endLabel.hidden=false
                    self.totalLabel.hidden=false
                    self.endLabel.alpha=1
                    self.totalLabel.alpha=1
                    self.tipLabel.alpha=1
                })
            }
            
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex=defaults.integerForKey("key2")
        let num=defaults.integerForKey("key3")
        if num==0{
            numMain=num
            UIView.animateWithDuration(0.3, animations: {
                self.body.backgroundColor=UIColor.init(red:0.996078,green:0.839216,blue:0.0352941,alpha:1)
            })
        }
        else if num==1{
            numMain=num
            UIView.animateWithDuration(0.3, animations: {
                self.body.backgroundColor=UIColor.init(red:1,green:1,blue:1,alpha:1)
            })
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(numMain, forKey: "key4")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        check=1
    }
    
}

