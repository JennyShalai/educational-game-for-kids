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
    
    var isAvocadoMoving: Bool = false
    var isOrangeMoving: Bool = false
    var isFruitMoving: Bool = false
    var isBerryMoving: Bool = false
    
    var isAvocadoMatch: Bool = false
    var isOrangeMatch: Bool = false
    var isFruitMatch: Bool = false
    var isBerryMatch: Bool = false
    
    let maxIndexZ: CGFloat = 5
    
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
            
            if self.avocadoImg.frame.contains(location) && !isAvocadoMatch {
                self.avocadoImg.center = location
                self.avocadoImg.layer.zPosition = self.maxIndexZ
                self.isAvocadoMoving = true
                return
            }
            
            if self.orangeImg.frame.contains(location) && !isOrangeMatch {
                self.orangeImg.center = location
                self.orangeImg.layer.zPosition = self.maxIndexZ
                self.isOrangeMoving = true
                return
            }
            
            if self.fruitImg.frame.contains(location) && !isFruitMatch {
                self.fruitImg.center = location
                self.fruitImg.layer.zPosition = self.maxIndexZ
                self.isFruitMoving = true
                return
            }
            
            if self.berryImg.frame.contains(location) && !isBerryMatch {
                self.berryImg.center = location
                self.berryImg.layer.zPosition = self.maxIndexZ
                self.isBerryMoving = true
                return
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            
            let location = touch.locationInView(self.view)
            
            if self.avocadoImg.frame.contains(location) && self.isAvocadoMoving {
                self.avocadoImg.center = location
            }
            
            if self.orangeImg.frame.contains(location) && self.isOrangeMoving {
                self.orangeImg.center = location
            }
            
            if self.fruitImg.frame.contains(location) && self.isFruitMoving {
                self.fruitImg.center = location
            }
            
            if self.berryImg.frame.contains(location) && self.isBerryMoving {
                self.berryImg.center = location
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.checkCollisions()
        
        self.isAvocadoMoving = false
        self.isOrangeMoving = false
        self.isFruitMoving = false
        self.isBerryMoving = false
        
        self.avocadoImg.layer.zPosition = 4
        self.orangeImg.layer.zPosition = 3
        self.fruitImg.layer.zPosition = 2
        self.berryImg.layer.zPosition = 1
    }
    
    func checkCollisions() {
        
        if CGRectIntersectsRect(avocadoImg.frame, avocadoShadowImg.frame) {
            
            self.avocadoImg.center = self.avocadoShadowImg.center
            self.avocadoShadowImg.hidden = true
            self.isAvocadoMatch = true
        }
        
        if CGRectIntersectsRect(orangeImg.frame, orangeShadowImg.frame) {
            
            self.orangeImg.center = self.orangeShadowImg.center
            self.orangeShadowImg.hidden = true
            self.isOrangeMatch = true
        }
        
        if CGRectIntersectsRect(fruitImg.frame, fruitShadowImg.frame) {
            
            self.fruitImg.center = self.fruitShadowImg.center
            self.fruitShadowImg.hidden = true
            self.isFruitMatch = true
        }
        
        if CGRectIntersectsRect(berryImg.frame, berryShadowImg.frame) {
            
            self.berryImg.center = self.berryShadowImg.center
            self.berryShadowImg.hidden = true
            self.isBerryMatch = true
        }
        
        if CGRectIntersectsRect(avocadoImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, berryShadowImg.frame) {
            
            self.avocadoImg.frame.origin.x = 45
            self.avocadoImg.frame.origin.y = 42
        }
        
        if CGRectIntersectsRect(orangeImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, berryShadowImg.frame) {
            
            self.orangeImg.frame.origin.x = 45
            self.orangeImg.frame.origin.y = 172
        }
        
        if CGRectIntersectsRect(fruitImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, berryShadowImg.frame) {
            
            self.fruitImg.frame.origin.x = 45
            self.fruitImg.frame.origin.y = 298
        }
        
        if CGRectIntersectsRect(berryImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, fruitShadowImg.frame) {
            
            self.berryImg.frame.origin.x = 50
            self.berryImg.frame.origin.y = 421
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
