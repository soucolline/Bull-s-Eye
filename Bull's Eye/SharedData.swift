//
//  SharedData.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 04/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import Foundation


class SharedData {
    static let sharedInstance = SharedData();
    
    var isDebugOn:Bool;
    var gameDifficulty:Difficulty;
    
    init () {
        isDebugOn = false;
        gameDifficulty = Difficulty.Easy;
    }
}