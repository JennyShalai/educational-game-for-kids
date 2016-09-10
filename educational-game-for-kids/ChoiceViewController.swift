//
//  ChoiceViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/10/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var animalsImg: UIImageView!

    @IBOutlet weak var numbersImg: UIImageView!
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var vehicleImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGestures()
    }
    
    func setGestures() {
        // set tap action for animals image
        let animalsImageView = self.animalsImg
        let tapAnimalsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.animalsImageTapped(_:)))
        animalsImageView.userInteractionEnabled = true
        animalsImageView.addGestureRecognizer(tapAnimalsGestureRecognizer)
        
        // set tap action for numbers image
        let numbersImageView = self.numbersImg
        let tapNumbersGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.numbersImageTapped(_:)))
        numbersImageView.userInteractionEnabled = true
        numbersImageView.addGestureRecognizer(tapNumbersGestureRecognizer)
        
        // set tap action for food image
        let foodImageView = self.foodImg
        let tapFoodGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.foodImageTapped(_:)))
        foodImageView.userInteractionEnabled = true
        foodImageView.addGestureRecognizer(tapFoodGestureRecognizer)
        
        // set tap action for vehicle image
        let vehicleImageView = self.vehicleImg
        let tapVehicleGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.vehicleImageTapped(_:)))
        vehicleImageView.userInteractionEnabled = true
        vehicleImageView.addGestureRecognizer(tapVehicleGestureRecognizer)
    }
    
    func animalsImageTapped(img: AnyObject) {
        print("ANIMALS WORK!")
    }
    
    func foodImageTapped(img: AnyObject) {
        print("FOOD WORK!")
    }
    
    func numbersImageTapped(img: AnyObject) {
        print("NUMBERS WORK!")
    }
    
    func vehicleImageTapped(img: AnyObject) {
        print("VEHICLE WORK!")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}