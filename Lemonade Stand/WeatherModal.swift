//
//  WeatherModal.swift
//  Lemonade Stand
//
//  Created by JoeE on 10/28/14.
//  Copyright (c) 2014 JoeE. All rights reserved.
//

import Foundation
import UIKit


class ModalController: UIViewController{
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    var weatherType = ""
    var weatherImage = UIImage(named:"Mild")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        weatherIcon.image = weatherImage
        weatherStatusLabel.text = "Todays is a new day, the weather will be \(weatherType)"
    }
    
}