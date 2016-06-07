//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 29/05/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

extension Double {
    func isGameSpeedLimit(limit:Double) -> Double {
        var num = limit;
        if num <= 0.003 {
            num = 0.002;
        }
        
        return num;
    }
}

class ViewController: UIViewController {

    
    var objective:Int = 0;
    var lifePoints:Int = 0;
    var round:Int = 1;
    
    var timer:NSTimer?;
    var sliderSpeed:Double = 0.01
    var sliderMovement:String = "right";
    
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!;
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    @IBOutlet weak var lifePointsLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    @IBAction func stopPressed(sender: UIButton) {
        if timer != nil {
            timer?.invalidate();
        }
        
        getPoints(Int(slider.value), objective: objective);
        
        print(sliderSpeed);
    }
    
    @IBAction func debugValueChange(sender: UISlider) {
        debugLabel.text = String(Int(floor(slider.value)));
        //debugLabel.text = String(SharedData.gameDifficulty);
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
            if self.timer != nil {
                if SharedData.gameDifficulty == Difficulty.Difficult {
                    self.sliderSpeed = self.sliderSpeed / 1.5;
                }
                self.sliderSpeed = self.sliderSpeed.isGameSpeedLimit(self.sliderSpeed);
                self.scheduleTimer();
            }
            
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
        if timer != nil {
            timer?.invalidate();
        }
        
        lifePoints = 0;
        lifePointsLabel.text = String(lifePoints);
        stopButton.enabled = !stopButton.enabled;
        
        let alert = UIAlertController(title: "You lost", message: "You went \(round) rounds! Do you want to start a new game ?", preferredStyle: .Alert);
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: { (alert:UIAlertAction) in
            self.restartGame();
        });
        let noAction = UIAlertAction(title: "No", style: .Destructive, handler: {
            (alert:UIAlertAction) in
            self.navigationController?.popToRootViewControllerAnimated(true);
        });
        
        alert.addAction(yesAction);
        alert.addAction(noAction);
        
        presentViewController(alert, animated: true, completion: nil);
    }
    
    func restartGame() {
        lifePoints = 100;
        round = 1;
        sliderSpeed = 0.01;
        objective = generateRandomNumber();
        
        lifePointsLabel.text = String(lifePoints);
        roundLabel.text = String(round);
        goalLabel.text = String(objective);
        
        stopButton.enabled = !stopButton.enabled;
        
        if timer != nil {
            scheduleTimer();
        }
    }
    
    
    func scheduleTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(sliderSpeed, target: self, selector: #selector(ViewController.moveSlider), userInfo: nil, repeats: true);
    }
    
    func moveSlider() {
        if sliderMovement == "right" {
            UIView.animateWithDuration(sliderSpeed, animations: {
                self.slider.setValue((self.slider.value + 1), animated: false);
            });
            
            if slider.value >= 100.0 {
                sliderMovement = "left";
            }
        } else {
            UIView.animateWithDuration(sliderSpeed, animations: {
                self.slider.setValue((self.slider.value - 1), animated: false);
            });
            
            if slider.value <= 0 {
                sliderMovement = "right";
            }
        }
        
        
        //slider.setValue((slider.value + 10), animated: true);
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        objective = generateRandomNumber();
        goalLabel.text = String(objective);
        roundLabel.text = String(round);
        lifePoints = 100;
        
        if !SharedData.isDebugOn {
            debugLabel.hidden = true;
        } else {
            debugLabel.text = String(Int(slider.value));
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        if SharedData.gameDifficulty != Difficulty.Easy {
            scheduleTimer();
        }
        
        stopButton.enabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

