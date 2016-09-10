//
//  ViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/8/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

internal class ViewController: UIViewController {

    
    
    @IBOutlet weak var chicken: UIImageView!
    @IBOutlet weak var crocodile: UIImageView!
    @IBOutlet weak var cuala: UIImageView!
    @IBOutlet weak var raccoon: UIImageView!
    @IBOutlet weak var chickenShadow: UIImageView!
    @IBOutlet weak var raccoonShadow: UIImageView!
    @IBOutlet weak var cualaShadow: UIImageView!
    @IBOutlet weak var crocodileShadow: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.view.frame.height) \(self.view.frame.width)")
        
        print("chicken \(self.chicken.frame.origin.x) \(self.chicken.frame.origin.y)")
        print("crocodile \(self.crocodile.frame.origin.x) \(self.crocodile.frame.origin.y)")
        print("cuala \(self.cuala.frame.origin.x) \(self.cuala.frame.origin.y)")
        print("raccoon \(self.raccoon.frame.origin.x) \(self.raccoon.frame.origin.y)")
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
           
            if self.chicken.frame.contains(location) {
                self.chicken.center = location
            }
            if self.crocodile.frame.contains(location) {
                self.crocodile.center = location
            }
            if self.cuala.frame.contains(location) {
                self.cuala.center = location
            }
            
            if self.raccoon.frame.contains(location) {
                self.raccoon.center = location
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.cuala.frame.contains(location) {
                self.cuala.center = location
            }
            if self.crocodile.frame.contains(location) {
                self.crocodile.center = location
            }
            if self.raccoon.frame.contains(location) {
                self.raccoon.center = location
            }
            if self.chicken.frame.contains(location) {
                self.chicken.center = location
            }
            
            if CGRectIntersectsRect(chicken.frame, chickenShadow.frame) {
                print("chicken.")
                self.chicken.center = self.chickenShadow.center
                self.chickenShadow.hidden = true
                
            }
            
            if CGRectIntersectsRect(cuala.frame, cualaShadow.frame) {
                print("cuala.")
                self.cuala.center = self.cualaShadow.center
                self.cualaShadow.hidden = true
                
            }
            
            if CGRectIntersectsRect(crocodile.frame, crocodileShadow.frame) {
                print("crocodile.")
                self.crocodile.center = self.crocodileShadow.center
                self.crocodileShadow.hidden = true
            }
            
            if CGRectIntersectsRect(raccoon.frame, raccoonShadow.frame) {
                print("raccoon.")
                self.raccoon.center = self.raccoonShadow.center
                self.raccoonShadow.hidden = true
            
            }
            
          
            
            if CGRectIntersectsRect(cuala.frame, crocodileShadow.frame) || CGRectIntersectsRect(cuala.frame, raccoonShadow.frame) || CGRectIntersectsRect(cuala.frame, chickenShadow.frame) {
                print("WRONG CUALA.")
                self.cuala.frame.origin.x = 20
                self.cuala.frame.origin.y = 282
            }
            
            if CGRectIntersectsRect(crocodile.frame, cualaShadow.frame) || CGRectIntersectsRect(crocodile.frame, raccoonShadow.frame) || CGRectIntersectsRect(crocodile.frame, chickenShadow.frame) {
                print("WRONG CROCODILE.")
                self.crocodile.frame.origin.x = 20
                self.crocodile.frame.origin.y = 191
            }
            
            if CGRectIntersectsRect(raccoon.frame, cualaShadow.frame) || CGRectIntersectsRect(raccoon.frame, crocodileShadow.frame) || CGRectIntersectsRect(raccoon.frame, chickenShadow.frame) {
                print("WRONG RACCOON.")
                self.raccoon.frame.origin.x = 20
                self.raccoon.frame.origin.y = 442
            }
            
            if CGRectIntersectsRect(chicken.frame, cualaShadow.frame) || CGRectIntersectsRect(chicken.frame, crocodileShadow.frame) || CGRectIntersectsRect(chicken.frame, raccoonShadow.frame) {
                print("WRONG CHICKEN.")
                self.chicken.frame.origin.x = 20
                self.chicken.frame.origin.y = 108
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

