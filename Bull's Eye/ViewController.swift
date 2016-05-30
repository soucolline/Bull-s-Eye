//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 29/05/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var objective:Int = 0;
    var lifePoints:Int = 0;
    var round:Int = 1;
    
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    @IBOutlet weak var lifePointsLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    @IBAction func stopPressed(sender: UIButton) {
        getPoints(Int(slider.value), objective: objective);
    }
    
    @IBAction func debugValueChange(sender: UISlider) {
        debugLabel.text = String(Int(floor(slider.value)));
    }
    
    
    
    
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(100));
    }
    
    func getPoints(sliderValue:Int, objective:Int) {
        var result:String = "";
        
        if sliderValue > objective {
            result = "Too high !";
        } else if sliderValue < objective {
            result = "Too low";
        } else {
            result = "Perfect";
        }
        
        let alert = UIAlertController(title: "Result", message: result, preferredStyle: .Alert);
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert:UIAlertAction) in
            self.removeLifePoints(self.lifePoints, difference: abs(sliderValue - objective));
        });
        
        alert.addAction(alertAction);
        
        presentViewController(alert, animated: true, completion: nil);
    }
    
    func removeLifePoints(points:Int, difference:Int) {
        lifePoints -= difference;
        lifePointsLabel.text = String(lifePoints);
        
        if lifePoints <= 0 {
            lostGame();
        } else {
            newRound();
        }
        
        print(lifePoints);
    }
    
    func newRound() {
        objective = generateRandomNumber();
        round += 1;
        goalLabel.text = String(objective);
        roundLabel.text = String(round);
    }
    
    func lostGame() {
        lifePoints = 0;
        lifePointsLabel.text = String(lifePoints);
        stopButton.enabled = !stopButton.enabled;
        
        let alert = UIAlertController(title: "You lost", message: "You went \(round) rounds! Do you want to start a new game ?", preferredStyle: .Alert);
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: { (alert:UIAlertAction) in
            self.restartGame();
        });
        let noAction = UIAlertAction(title: "No", style: .Destructive, handler: nil);
        
        alert.addAction(yesAction);
        alert.addAction(noAction);
        
        presentViewController(alert, animated: true, completion: nil);
    }
    
    func restartGame() {
        lifePoints = 100;
        round = 1;
        objective = generateRandomNumber();
        
        lifePointsLabel.text = String(lifePoints);
        roundLabel.text = String(round);
        goalLabel.text = String(objective);
        
        stopButton.enabled = !stopButton.enabled;
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        objective = generateRandomNumber();
        goalLabel.text = String(objective);
        roundLabel.text = String(round);
        lifePoints = 100;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

