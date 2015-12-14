//
//  SettingsViewController.swift
//  tips
//
//  Created by Parth Bhardwaj on 12/13/15.
//  Copyright © 2015 Parth Bhardwaj. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var body2: UIView!
    @IBOutlet weak var colorPick: UISegmentedControl!
    @IBOutlet weak var secondSelector: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNewChange(sender: AnyObject) {
        let tipPercentages=[0.18,0.2,0.25]
        let tipPercetange=tipPercentages[secondSelector.selectedSegmentIndex]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercetange, forKey: "key")
        defaults.setInteger(secondSelector.selectedSegmentIndex, forKey: "key2")
        defaults.synchronize()
    }
    
    
    @IBAction func onColor(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(colorPick.selectedSegmentIndex, forKey: "key3")
        defaults.synchronize()
        let num=colorPick.selectedSegmentIndex
        if num==0{
            UIView.animateWithDuration(0.3, animations: {
                self.body2.backgroundColor=UIColor.init(red:0.996078,green:0.839216,blue:0.0352941,alpha:1)
            })
        }
        else if num==1{
            UIView.animateWithDuration(0.3, animations: {
                self.body2.backgroundColor=UIColor.init(red:1,green:1,blue:1,alpha:1)
            })
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let num = defaults.integerForKey("key4")
        if num==0{
            UIView.animateWithDuration(0.3, animations: {
                self.body2.backgroundColor=UIColor.init(red:0.996078,green:0.839216,blue:0.0352941,alpha:1)
            })
        }
        else if num==1{
            UIView.animateWithDuration(0.3, animations: {
                self.body2.backgroundColor=UIColor.init(red:1,green:1,blue:1,alpha:1)
            })
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
