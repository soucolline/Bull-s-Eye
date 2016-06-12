//
//  AddNewScoreTableViewController.swift
//  Bulls_Eye
//
//  Created by Thomas Guilleminot on 12/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

protocol AddNewScoreTableViewControllerDelegate: class {
    func addNewScoreTableViewControllerDidCancel(controller:AddNewScoreTableViewController);
    func addNewScoreTableViewController(controller:AddNewScoreTableViewController, didFinishAddingScore score:Score);
}


class AddNewScoreTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.addNewScoreTableViewControllerDidCancel(self);
    }
    
    @IBAction func done(sender: AnyObject) {
        if let round = score {
            let newScore = Score();
            newScore.rounds = round;
            newScore.playerName = textField.text!;
            
            delegate?.addNewScoreTableViewController(self, didFinishAddingScore: newScore);
        }
    }
    
    weak var delegate:AddNewScoreTableViewControllerDelegate?;
    var score:Int?;
    
    
    // MARK: - TextField Delegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText:NSString = textField.text!;
        let newText:NSString = oldText.stringByReplacingCharactersInRange(range, withString: string);
        
        doneBarBtn.enabled = newText.length > 0;
        
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dismissKeyboard();
        
        return true;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.navigationBarHidden = false;
        self.navigationItem.title = "New Score";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
