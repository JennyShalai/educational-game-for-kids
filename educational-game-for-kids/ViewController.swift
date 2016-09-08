//
//  ViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/8/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bear: UIImageView!
    @IBOutlet weak var chicken: UIImageView!
    @IBOutlet weak var crocodile: UIImageView!
    @IBOutlet weak var cuala: UIImageView!
    @IBOutlet weak var monkey: UIImageView!
    @IBOutlet weak var raccoon: UIImageView!
    @IBOutlet weak var chickenShadow: UIImageView!
    @IBOutlet weak var raccoonShadow: UIImageView!
    @IBOutlet weak var monkeyShadow: UIImageView!
    @IBOutlet weak var cualaShadow: UIImageView!
    @IBOutlet weak var crocodileShadow: UIImageView!
    @IBOutlet weak var bearShadow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.bear.frame.contains(location) {
                self.bear.center = location
            }
            if self.chicken.frame.contains(location) {
                self.chicken.center = location
            }
            if self.crocodile.frame.contains(location) {
                self.crocodile.center = location
            }
            if self.cuala.frame.contains(location) {
                self.cuala.center = location
            }
            if self.monkey.frame.contains(location) {
                self.monkey.center = location
            }
            if self.raccoon.frame.contains(location) {
                self.raccoon.center = location
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.bear.frame.contains(location) {
                self.bear.center = location
            }
            if self.monkey.frame.contains(location) {
                self.monkey.center = location
            }
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
            
            if CGRectIntersectsRect(bear.frame, bearShadow.frame) {
                print("BEAR.")
            } else if CGRectIntersectsRect(monkey.frame, monkeyShadow.frame) {
                print("monkey.")
            } else if CGRectIntersectsRect(cuala.frame, cualaShadow.frame) {
                print("cuala.")
            } else if CGRectIntersectsRect(crocodile.frame, crocodileShadow.frame) {
                print("crocodile.")
            } else if CGRectIntersectsRect(raccoon.frame, raccoonShadow.frame) {
                print("raccoon.")
            } else if CGRectIntersectsRect(chicken.frame, chickenShadow.frame) {
                print("chicken.")
            } else if CGRectIntersectsRect(bear.frame, monkeyShadow.frame) || CGRectIntersectsRect(bear.frame, cualaShadow.frame) || CGRectIntersectsRect(bear.frame, crocodileShadow.frame) || CGRectIntersectsRect(bear.frame, raccoonShadow.frame) || CGRectIntersectsRect(bear.frame, chickenShadow.frame) {
                print("BEAR WRONG.")
            } else if CGRectIntersectsRect(monkey.frame, bearShadow.frame) || CGRectIntersectsRect(monkey.frame, cualaShadow.frame) || CGRectIntersectsRect(monkey.frame, crocodileShadow.frame) || CGRectIntersectsRect(monkey.frame, raccoonShadow.frame) || CGRectIntersectsRect(monkey.frame, chickenShadow.frame) {
                print("BEAR MONKEY.")
            } else if CGRectIntersectsRect(cuala.frame, monkeyShadow.frame) || CGRectIntersectsRect(cuala.frame, bearShadow.frame) || CGRectIntersectsRect(cuala.frame, crocodileShadow.frame) || CGRectIntersectsRect(cuala.frame, raccoonShadow.frame) || CGRectIntersectsRect(cuala.frame, chickenShadow.frame) {
                print("BEAR CUALA.")
            } else if CGRectIntersectsRect(crocodile.frame, monkeyShadow.frame) || CGRectIntersectsRect(crocodile.frame, cualaShadow.frame) || CGRectIntersectsRect(crocodile.frame, bearShadow.frame) || CGRectIntersectsRect(crocodile.frame, raccoonShadow.frame) || CGRectIntersectsRect(crocodile.frame, chickenShadow.frame) {
                print("BEAR CROCODILE.")
            } else if CGRectIntersectsRect(raccoon.frame, monkeyShadow.frame) || CGRectIntersectsRect(raccoon.frame, cualaShadow.frame) || CGRectIntersectsRect(raccoon.frame, crocodileShadow.frame) || CGRectIntersectsRect(raccoon.frame, bearShadow.frame) || CGRectIntersectsRect(raccoon.frame, chickenShadow.frame) {
                print("BEAR RACCOON.")
            } else if CGRectIntersectsRect(chicken.frame, monkeyShadow.frame) || CGRectIntersectsRect(chicken.frame, cualaShadow.frame) || CGRectIntersectsRect(chicken.frame, crocodileShadow.frame) || CGRectIntersectsRect(chicken.frame, raccoonShadow.frame) || CGRectIntersectsRect(chicken.frame, bearShadow.frame) {
                print("BEAR CHICKEN.")
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

