//
//  CustomSegue.swift
//  Bulls_Eye
//
//  Created by Thomas Guilleminot on 14/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        var firstVCView = sourceViewController.view as! UIView;
        var thirdVCView = destinationViewController.view as! UIView;
        
        let window = UIApplication.sharedApplication().keyWindow;
        window?.insertSubview(thirdVCView, belowSubview: firstVCView);
        
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001);
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
            
        }) { (Finished) -> Void in
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                thirdVCView.transform = CGAffineTransformIdentity
                
                }, completion: { (Finished) -> Void in
                    
                    firstVCView.transform = CGAffineTransformIdentity
                    self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
            })
        }
        
    }
}
