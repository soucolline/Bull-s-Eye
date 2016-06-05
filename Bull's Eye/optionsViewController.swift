//
//  optionsViewController.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 04/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedArround() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard");
        view.addGestureRecognizer(tap);
    }
    
    func dismissKeyboard() {
        view.endEditing(true);
    }
}

class optionsViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var debugSwitchOutlet: UISwitch!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var difficultyOutlet: UILabel!
    
    
    var difficultyPicker = UIPickerView();
    
    var difficultyOptions:[Difficulty] = [Difficulty.Easy, Difficulty.Medium, Difficulty.Difficult];
    
    
    
    @IBAction func debugSwitch(sender: UISwitch) {
        if sender.on {
            SharedData.sharedInstance.isDebugOn = true;
        } else {
            SharedData.sharedInstance.isDebugOn = false;
        }
    }
    
    @IBAction func textFieldPressed(sender: UITextField) {
        textFieldOutlet.becomeFirstResponder();
    }
    
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficultyOptions.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficultyOptions[row].rawValue;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        difficultyOutlet.text = difficultyOptions[row].rawValue;
        SharedData.sharedInstance.gameDifficulty = difficultyOptions[row];
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.navigationBarHidden = false;
        self.navigationController?.navigationBar.topItem?.title = "Options";
        
        debugSwitchOutlet.on = SharedData.sharedInstance.isDebugOn;
        
        textFieldOutlet.tintColor = UIColor.clearColor();
        difficultyOutlet.text = SharedData.sharedInstance.gameDifficulty.rawValue;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textFieldOutlet.delegate = self;
        difficultyPicker.dataSource = self;
        difficultyPicker.delegate = self;
        textFieldOutlet.inputView = difficultyPicker;
        
        self.hideKeyboardWhenTappedArround();
        
        print(String(SharedData.sharedInstance.gameDifficulty));

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
