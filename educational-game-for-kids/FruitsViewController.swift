//
//  NumbersViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/10/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {

    
    @IBOutlet weak var avocadoImg: UIImageView!
    @IBOutlet weak var orangeImg: UIImageView!
    @IBOutlet weak var fruitImg: UIImageView!
    @IBOutlet weak var berryImg: UIImageView!
    
    
    @IBOutlet weak var orangeShadowImg: UIImageView!
    @IBOutlet weak var berryShadowImg: UIImageView!
    @IBOutlet weak var fruitShadowImg: UIImageView!
    @IBOutlet weak var avocadoShadowImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.view.frame.height) \(self.view.frame.width)")
        
        print("avocado \(self.avocadoImg.frame.origin.x) \(self.avocadoImg.frame.origin.y)")
        print("orange \(self.orangeImg.frame.origin.x) \(self.orangeImg.frame.origin.y)")
        print("fruit \(self.fruitImg.frame.origin.x) \(self.fruitImg.frame.origin.y)")
        print("berry \(self.berryImg.frame.origin.x) \(self.berryImg.frame.origin.y)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.avocadoImg.frame.contains(location) {
                self.avocadoImg.center = location
            }
            if self.orangeImg.frame.contains(location) {
                self.orangeImg.center = location
            }
            if self.fruitImg.frame.contains(location) {
                self.fruitImg.center = location
            }
            
            if self.berryImg.frame.contains(location) {
                self.berryImg.center = location
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.avocadoImg.frame.contains(location) {
                self.avocadoImg.center = location
            }
            if self.orangeImg.frame.contains(location) {
                self.orangeImg.center = location
            }
            if self.fruitImg.frame.contains(location) {
                self.fruitImg.center = location
            }
            if self.berryImg.frame.contains(location) {
                self.berryImg.center = location
            }
            
            if CGRectIntersectsRect(avocadoImg.frame, avocadoShadowImg.frame) {
                print("AVOCADO.")
                self.avocadoImg.center = self.avocadoShadowImg.center
                self.avocadoShadowImg.hidden = true
                
            }
            
            if CGRectIntersectsRect(orangeImg.frame, orangeShadowImg.frame) {
                print("ORANGE.")
                self.orangeImg.center = self.orangeShadowImg.center
                self.orangeShadowImg.hidden = true
                
            }
            
            if CGRectIntersectsRect(fruitImg.frame, fruitShadowImg.frame) {
                print("FRUIT.")
                self.fruitImg.center = self.fruitShadowImg.center
                self.fruitShadowImg.hidden = true
            }
            
            if CGRectIntersectsRect(berryImg.frame, berryShadowImg.frame) {
                print("BERRY.")
                self.berryImg.center = self.berryShadowImg.center
                self.berryShadowImg.hidden = true
                
            }
            
            
            
            if CGRectIntersectsRect(avocadoImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, berryShadowImg.frame) {
                print("WRONG AVOCADO.")
                self.avocadoImg.frame.origin.x = 45
                self.avocadoImg.frame.origin.y = 42
            }
            
            if CGRectIntersectsRect(orangeImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, berryShadowImg.frame) {
                print("WRONG ORANGE.")
                self.orangeImg.frame.origin.x = 45
                self.orangeImg.frame.origin.y = 172
            }
            
            if CGRectIntersectsRect(fruitImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, berryShadowImg.frame) {
                print("WRONG FRUIT.")
                self.fruitImg.frame.origin.x = 45
                self.fruitImg.frame.origin.y = 298
            }
            
            if CGRectIntersectsRect(berryImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, fruitShadowImg.frame) {
                print("WRONG BERRY.")
                self.berryImg.frame.origin.x = 50
                self.berryImg.frame.origin.y = 421
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
