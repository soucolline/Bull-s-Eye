//
//  optionsViewController.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 04/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

class optionsViewController: UITableViewController {

    @IBOutlet weak var debugSwitchOutlet: UISwitch!
    
    
    @IBAction func debugSwitch(sender: UISwitch) {
        if sender.on {
            SharedData.sharedInstance.isDebugOn = true;
        } else {
            SharedData.sharedInstance.isDebugOn = false;
        }
    }
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.navigationBarHidden = false;
        self.navigationController?.navigationBar.topItem?.title = "Options";
        
        debugSwitchOutlet.on = SharedData.sharedInstance.isDebugOn;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
