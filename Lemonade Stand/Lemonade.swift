//
//  Lemonade.swift
//  Lemonade Stand
//
//  Created by JoeE on 10/27/14.
//  Copyright (c) 2014 JoeE. All rights reserved.
//

import Foundation

struct Lemonade {
    let favorsAcidicLemonade = (lower: 0.0, upper: 0.4)
    let favorsEqualPartsLemonade = (lower: 0.4, upper: 0.6)
    let favorsLighterLemondade = (lower: 0.6, upper: 1.0)
    
    
    func lemonadeStrengthWeight() -> [(lower:Double, upper:Double)]
    {
        var strengthOfLemonade = [favorsAcidicLemonade, favorsEqualPartsLemonade, favorsLighterLemondade]
        
        return strengthOfLemonade
    }
    
    func lemonadeMixture(lemons:Int, ice:Int) ->Int
    {
        if lemons == 0
        {
          return 0
        }else if ice == 0
        {
            return 2
        }else{
        var taste = lemons/ice
            
        return taste
        }
    }
    
}