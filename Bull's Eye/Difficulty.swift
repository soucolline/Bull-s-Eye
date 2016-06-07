//
//  Difficulty.swift
//  Bull's Eye
//
//  Created by Thomas Guilleminot on 04/06/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import Foundation


//enum Difficulty:String {
//    case Easy = "Easy";
//    case Medium = "Medium";
//    case Difficult = "Difficult";
//}

enum Difficulty:Int {
    case Easy = 0;
    case Medium = 1;
    case Difficult = 2;
    
    func getName() -> String {
        switch self {
        case .Easy:
            return "Easy"
        case .Medium:
            return "Medium"
        case .Difficult:
            return "Difficult"
        }
    }
}

