//
//  Factory.swift
//  Lemonade Stand
//
//  Created by JoeE on 10/27/14.
//  Copyright (c) 2014 JoeE. All rights reserved.
//

import Foundation

class Factory {
    

   

    
    
    class func startDay(lemonInMix:Int, iceInMix:Int, weather:String) -> Int
    {
        var totalSales = 0
        
        var lemonade = Lemonade()
        var lemondadeMixture = lemonade.lemonadeMixture(lemonInMix, ice: iceInMix)
        
        var customers = createCustomers(lemonade, weather:weather )
        
        
        for customer  in customers{
           
            if customer.lowerTaste >= 0.0 && customer.upperTaste <= 0.4 && lemondadeMixture < 1{
                totalSales += 1
            }else if customer.lowerTaste >= 0.4 && customer.upperTaste <= 0.6 && lemondadeMixture == 1{
                 totalSales += 1
            } else if customer.upperTaste >= 0.6 && lemondadeMixture > 1 {
                totalSales += 1
            }
            
         
        }
          return totalSales
    }
    
    class func createCustomers(lemonade:Lemonade, weather:String) -> [(customerID:Int, lowerTaste:Double, upperTaste:Double)]
    {
     
         let numberOfPossibleCustomers = 10
      
        var strengthOfLemondade =  lemonade.lemonadeStrengthWeight()
        
        var numberOfCustomers = Int(arc4random_uniform(UInt32(numberOfPossibleCustomers)))
        
        if weather == "Warm"
        {
            numberOfCustomers  = numberOfCustomers + 3
        }else if weather == "Cold"
        {
            numberOfCustomers  = numberOfCustomers - 3
        }
        
        
        var customers:[(customerID:Int, lowerTaste:Double, upperTaste:Double)] = []
        
        for var i = 0; i < numberOfCustomers; i++
        {
           var customerTaste = strengthOfLemondade[Int(arc4random_uniform(UInt32(strengthOfLemondade.count)))]
            
            customers += [(customerID:i, lowerTaste:customerTaste.lower, upperTaste:customerTaste.upper)]
            

        }
   
        return customers
        
    }
    

        
    }
    
