//
//  weather.swift
//  Lemonade Stand
//
//  Created by JoeE on 10/27/14.
//  Copyright (c) 2014 JoeE. All rights reserved.
//

import Foundation
import UIKit
class Weather {
    
    var typeOfWeather = ""
    var weatherIcon = UIImage(named: "")
    
    class func buildWeather() -> (weatherType:String, image:UIImage)
    {
        var randomNumber = Int(arc4random_uniform(UInt32(3)))
        var weather = (weatherType:"", image:UIImage(named:"Mild")!)
        
        println(randomNumber) 
        switch randomNumber{
        case 0:
            weather = (weatherType:"Cold", image:UIImage(named:"Cold")!)
        case 1:
            weather = (weatherType:"Mild", image:UIImage(named:"Mild")!)
        case 2:
            weather = (weatherType:"Warm", image:UIImage(named:"Warm")!)
        default:
            weather = (weatherType:"Mild", image:UIImage(named:"Mild")!)
        }
        
        return weather
        
    }

    
    
}