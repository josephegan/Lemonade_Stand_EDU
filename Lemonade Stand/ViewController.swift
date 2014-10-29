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
    @IBOutlet weak var weatherIconImage: UIImageView!
    
    var totalMoney = 10
    var lemons = 0
    var iceCubes = 0
    
    var lemonsInMix = 0
    var iceCubesInMix = 0
    
    var lemonsInCart = 0
    var iceCubesInCart = 0
    
    
    let lemonPrice = 2
    let iceCubePrice = 1
    var weatherType = "HOT"
    var weatherImage = UIImage(named:"Mild")
    
    //hold weather for day
    var todaysWeather = (weatherType:"", image: UIImage(named:"Mild")!  )
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        upDateGame()
    
      

    }
    
    override func viewDidAppear(animated:Bool)
    {
        todaysWeather  = Weather.buildWeather()
        weatherType = todaysWeather.weatherType
        weatherImage = todaysWeather.image
        displayWeatherAlert(todaysWeather)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonsButton(sender: UIButton) {
        
     if totalMoney > 0
     {
        lemonsInCart += 1
        lemons += 1
         totalMoney -= lemonPrice
        upDateGame()
    }else
    {
    showAlertWithText( message: "You need some money to buy lemons!", endOfDay:false )
    }
    }

    @IBAction func sellLemonButtons(sender: UIButton) {
      
        if lemonsInCart > 0
        {
        lemonsInCart -= 1
        lemons -= 1
        totalMoney += lemonPrice
        }
    
        upDateGame()
        
    }


    @IBAction func purchaseIceCubeButton(sender: UIButton) {
        
       if totalMoney > 0
       {
        
        iceCubesInCart += 1
        iceCubes += 1
      totalMoney -= iceCubePrice
        upDateGame()
        
    }else
    {
    showAlertWithText( message: "You need some money to buy Ice Cubes!", endOfDay:false )
    }
    
    }


    @IBAction func sellIceCubeButton(sender: UIButton) {
        
        if iceCubesInCart > 0
        {
         iceCubesInCart -= 1
            iceCubes -= 1
             totalMoney += iceCubePrice
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
            showAlertWithText( message: "You need some lemons!", endOfDay:false )
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
    showAlertWithText( message: "You need some Ice!",endOfDay:false )
    }
    
    }

    @IBAction func lessMixedIceCubeButton(sender: UIButton) {
        if iceCubesInMix > 0 {
        iceCubesInMix -= 1
        iceCubes += 1
         upDateGame()
        }
    }

    
    
    @IBAction func startTheDayButton(sender: UIButton) {

        if lemonsInMix == 0 && iceCubesInMix == 0
        {
        showAlertWithText( message: "You need to mix some lemonade first",endOfDay:false )

        
        }else{
          
            
      var dailySales = Factory.startDay(lemonsInMix, iceInMix: iceCubesInMix, weather: todaysWeather.weatherType)
            
        totalMoney += dailySales
        lemonsInMix = 0
        iceCubesInMix = 0
            lemonsInCart = 0
            iceCubesInCart = 0
            
             todaysWeather = Weather.buildWeather();
            weatherType = todaysWeather.weatherType
            weatherImage = todaysWeather.image
            
            if dailySales > 0
            {
                showAlertWithText( header: "Congrats" , message: " Today you made $ \(dailySales)", endOfDay:true )
            }
            else if (dailySales <= 0)
            {
                showAlertWithText( header: "Sorry" , message: " You made no money today", endOfDay:true )

            }
           
            
            upDateGame()
           
            
            
        }
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
    
    func showAlertWithText(header: String = "Warning", message:String, endOfDay:Bool)
    {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){
            UIAlertAction in
            if endOfDay{
                self.displayWeatherAlert(self.todaysWeather)}
            }
)
        

        
        self.presentViewController(alert, animated: true, completion:nil )
        
        
    }
    

    
    func displayWeatherAlert(typeOfWeather:(weatherType:String, image:UIImage)){
      
    
       [ performSegueWithIdentifier( "weatherModal", sender:self)]
        
    
    }

    @IBAction func returnToStepOne(segue: UIStoryboardSegue )
    {
       [dismissViewControllerAnimated(true, completion:nil)]
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        let controller = segue.destinationViewController as ModalController
        controller.weatherType  = weatherType
        controller.weatherImage = weatherImage
    }
    
}

