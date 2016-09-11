//
//  ViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/8/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class AnimalsViewController: UIViewController {

    
    
    @IBOutlet weak var chicken: UIImageView!
    @IBOutlet weak var crocodile: UIImageView!
    @IBOutlet weak var cuala: UIImageView!
    @IBOutlet weak var raccoon: UIImageView!
    
    @IBOutlet weak var chickenShadow: UIImageView!
    @IBOutlet weak var raccoonShadow: UIImageView!
    @IBOutlet weak var cualaShadow: UIImageView!
    @IBOutlet weak var crocodileShadow: UIImageView!
    
    var isChickenMoving: Bool = false
    var isCrocodileMoving: Bool = false
    var isCualaMoving: Bool = false
    var isRaccoonMoving: Bool = false
    
    var isChickenMatch: Bool = false
    var isCrocodileMatch: Bool = false
    var isCualaMatch: Bool = false
    var isRaccoonMatch: Bool = false
    
    let maxIndexZ: CGFloat = 5
    
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
           
            if self.cuala.frame.contains(location) && !isCualaMatch {
                self.cuala.center = location
                self.cuala.layer.zPosition = self.maxIndexZ
                self.isCualaMoving = true
                return
            }
            
            if self.chicken.frame.contains(location) && !isChickenMatch {
                self.chicken.center = location
                self.chicken.layer.zPosition = self.maxIndexZ
                self.isChickenMoving = true
                return
            }
            
            if self.crocodile.frame.contains(location) && !isCrocodileMatch {
                self.crocodile.center = location
                self.crocodile.layer.zPosition = self.maxIndexZ
                self.isCrocodileMoving = true
                return
            }
            
            if self.raccoon.frame.contains(location) && !isRaccoonMatch {
                self.raccoon.center = location
                self.raccoon.layer.zPosition = self.maxIndexZ
                self.isRaccoonMoving = true
                return
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            
            let location = touch.locationInView(self.view)
            
            if self.cuala.frame.contains(location) && self.isCualaMoving {
                self.cuala.center = location
            }
            
            if self.crocodile.frame.contains(location) && self.isCrocodileMoving {
                self.crocodile.center = location
            }
            
            if self.raccoon.frame.contains(location) && self.isRaccoonMoving {
                self.raccoon.center = location
            }
            
            if self.chicken.frame.contains(location) && self.isChickenMoving {
                self.chicken.center = location
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.checkCollisions()
        
        self.isChickenMoving = false
        self.isCrocodileMoving = false
        self.isRaccoonMoving = false
        self.isCualaMoving = false
        
        self.cuala.layer.zPosition = 4
        self.chicken.layer.zPosition = 3
        self.crocodile.layer.zPosition = 2
        self.raccoon.layer.zPosition = 1
    }
    
    func checkCollisions() {
        
        if CGRectIntersectsRect(chicken.frame, chickenShadow.frame) {
            
            self.chicken.center = self.chickenShadow.center
            self.chickenShadow.hidden = true
            self.isChickenMatch = true
            
        }
        
        if CGRectIntersectsRect(cuala.frame, cualaShadow.frame) {
            
            self.cuala.center = self.cualaShadow.center
            self.cualaShadow.hidden = true
            self.isCualaMatch = true
            
        }
        
        if CGRectIntersectsRect(crocodile.frame, crocodileShadow.frame) {
            
            self.crocodile.center = self.crocodileShadow.center
            self.crocodileShadow.hidden = true
            self.isCrocodileMatch = true
        }
        
        if CGRectIntersectsRect(raccoon.frame, raccoonShadow.frame) {
            
            self.raccoon.center = self.raccoonShadow.center
            self.raccoonShadow.hidden = true
            self.isRaccoonMatch = true
        }
        
        
        
        if CGRectIntersectsRect(cuala.frame, crocodileShadow.frame) || CGRectIntersectsRect(cuala.frame, raccoonShadow.frame) || CGRectIntersectsRect(cuala.frame, chickenShadow.frame) {
            
            self.cuala.frame.origin.x = 20
            self.cuala.frame.origin.y = 47
        }
        
        if CGRectIntersectsRect(crocodile.frame, cualaShadow.frame) || CGRectIntersectsRect(crocodile.frame, raccoonShadow.frame) || CGRectIntersectsRect(crocodile.frame, chickenShadow.frame) {
            
            self.crocodile.frame.origin.x = 31
            self.crocodile.frame.origin.y = 295
        }
        
        if CGRectIntersectsRect(raccoon.frame, cualaShadow.frame) || CGRectIntersectsRect(raccoon.frame, crocodileShadow.frame) || CGRectIntersectsRect(raccoon.frame, chickenShadow.frame) {
            
            self.raccoon.frame.origin.x = 32
            self.raccoon.frame.origin.y = 433
        }
        
        if CGRectIntersectsRect(chicken.frame, cualaShadow.frame) || CGRectIntersectsRect(chicken.frame, crocodileShadow.frame) || CGRectIntersectsRect(chicken.frame, raccoonShadow.frame) {
            
            self.chicken.frame.origin.x = 34
            self.chicken.frame.origin.y = 169
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

