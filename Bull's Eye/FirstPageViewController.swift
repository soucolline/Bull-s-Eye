//
//  FirstPageViewController.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 04/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    
    @IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var leaderboardBtnOutlet: UIButton!
    
    
    @IBAction func playBtnPressed(sender: UIButton) {
        playBtnOutlet.layer.shadowOffset = CGSizeMake(0, 0.0);
    }
    
    
    @IBAction func playBtnReleased(sender: UIButton) {
        playBtnOutlet.layer.shadowOffset = CGSizeMake(0, 2.0);
    }
    
   
    @IBAction func leaderboardBtnPressed(sender: UIButton) {
        leaderboardBtnOutlet.layer.shadowOffset = CGSizeMake(0, 0.0);
    }
    
    @IBAction func leaderboardBtnReleased(sender: UIButton) {
        leaderboardBtnOutlet.layer.shadowOffset = CGSizeMake(0, 2.0);
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.navigationBarHidden = true;
        
        playBtnOutlet.layer.shadowColor = UIColor.grayColor().CGColor;
        playBtnOutlet.layer.shadowOffset = CGSizeMake(0, 2.0);
        playBtnOutlet.layer.shadowOpacity = 0.7;
        playBtnOutlet.layer.shadowRadius = 1.0;
        playBtnOutlet.layer.cornerRadius = 5;
        
        leaderboardBtnOutlet.layer.shadowColor = UIColor.grayColor().CGColor;
        leaderboardBtnOutlet.layer.shadowOffset = CGSizeMake(0, 2.0);
        leaderboardBtnOutlet.layer.shadowOpacity = 0.7;
        leaderboardBtnOutlet.layer.shadowRadius = 1.0;
        leaderboardBtnOutlet.layer.cornerRadius = 5;
        
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
