//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by JoeE on 10/26/14.
//  Copyright (c) 2014 JoeE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountOfMoneyLabel: UILabel!
    @IBOutlet weak var totalNumberOfLemonsLabel: UILabel!
    @IBOutlet weak var totalNumberOfIceCubesLabel: UILabel!
    @IBOutlet weak var purchasedLemonsLabel: UILabel!
    @IBOutlet weak var purchasedIceCubesLabel: UILabel!
    @IBOutlet weak var mixedLemonsLabel: UILabel!
    @IBOutlet weak var mixedIceCubeLabels: UILabel!
    
    var totalMoney = 10
    var lemons = 0
    var iceCubes = 0
    
    var lemonsInMix = 0
    var iceCubesInMix = 0
    
    var lemonsInCart = 0
    var iceCubesInCart = 0
    
    
    let lemonPrice = 2
    let iceCubePrice = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        upDateGame()
     
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonsButton(sender: UIButton) {
        
     if totalMoney > 0
     {
        lemonsInCart += 1
  
        upDateGame()
    }else
    {
    showAlertWithText( message: "You need some money to buy lemons!")
    }
    }

    @IBAction func sellLemonButtons(sender: UIButton) {
      
        if lemonsInCart > 0
        {
        lemonsInCart -= 1
        }
    
        upDateGame()
        
    }


    @IBAction func purchaseIceCubeButton(sender: UIButton) {
        
       if totalMoney > 0
       {
        
        iceCubesInCart += 1
     
        upDateGame()
        
    }else
    {
    showAlertWithText( message: "You need some money to buy Ice Cubes!")
    }
    
    }


    @IBAction func sellIceCubeButton(sender: UIButton) {
        
        if iceCubesInCart > 0
        {
         iceCubesInCart -= 1
        }
    
        upDateGame()
    }

    @IBAction func addMixedLemonsButton(sender: UIButton) {
        
        if(lemons > 0){
        lemonsInMix += 1
        lemons -= 1
        upDateGame()
        }else
        {
            showAlertWithText( message: "You need some lemons!")
        }
        
    
    }

    @IBAction func lessMixedLemonButton(sender: UIButton) {
        if lemonsInMix > 0 {
        lemonsInMix -= 1
            lemons += 1
            upDateGame()
        }
        
        
    }

    @IBAction func addMixedIceCubesButton(sender: UIButton) {
        if iceCubes > 0{
        iceCubesInMix += 1
        iceCubes -= 1
         upDateGame()
    }else
    {
    showAlertWithText( message: "You need some Ice!")
    }
    
    }

    @IBAction func lessMixedIceCubeButton(sender: UIButton) {
        if iceCubesInMix > 0 {
        iceCubesInMix -= 1
        iceCubes += 1
         upDateGame()
        }
    }

    @IBAction func purchaseButton(sender: UIButton) {
        
    var lemonPriceForPurchase = lemonsInCart * lemonPrice
    var iceCubesPriceForPurchase = iceCubesInCart * iceCubePrice
        
        var totalPurchasePrice = lemonPriceForPurchase + iceCubesPriceForPurchase
        
       
        
        if totalMoney >= totalPurchasePrice
        {
            
            updateMoney(totalPurchasePrice, calculation: true)
            
            lemons = lemons + lemonsInCart
            iceCubes = iceCubes + iceCubesInCart
            lemonsInCart = 0
            iceCubesInCart = 0
            
            upDateGame()
        }else
        {
            showAlertWithText( message: "Sorry, you do not have enough money for this purchase")
        }
        
    }

    
    
    @IBAction func startTheDayButton(sender: UIButton) {
    }

    func upDateGame()
    {
        amountOfMoneyLabel.text = "$\(totalMoney)"
        totalNumberOfLemonsLabel.text = "\(lemons)";
        totalNumberOfIceCubesLabel.text  = "\(iceCubes)"
        purchasedLemonsLabel.text = "\(lemonsInCart)"
        purchasedIceCubesLabel.text = "\(iceCubesInCart)"
        mixedLemonsLabel.text = "\(lemonsInMix)"
        mixedIceCubeLabels.text = "\(iceCubesInMix)"
        
    }

    func resetGame()
    {
        amountOfMoneyLabel.text = "$\(0)"
        totalNumberOfLemonsLabel.text = "\(0)";
        totalNumberOfIceCubesLabel.text  = "\(0)"
        purchasedLemonsLabel.text = "\(0)"
        purchasedIceCubesLabel.text = "\(0)"
        mixedLemonsLabel.text = "\(0)"
        mixedIceCubeLabels.text = "\(0)"
        
    }
    
    func updateMoney(spent:Int, calculation:Bool)
    {
        if calculation
        {
            totalMoney = totalMoney - spent
        }else
        {
            totalMoney = totalMoney + spent
        }
    }
    
    func showAlertWithText(header: String = "Warning", message:String)
    {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}

