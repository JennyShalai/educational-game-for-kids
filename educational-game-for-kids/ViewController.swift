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
            }
            if CGRectIntersectsRect(monkey.frame, monkeyShadow.frame) {
                print("monkey.")
            }
            if CGRectIntersectsRect(cuala.frame, cualaShadow.frame) {
                print("cuala.")
            }
            if CGRectIntersectsRect(crocodile.frame, crocodileShadow.frame) {
                print("crocodile.")
            }
            if CGRectIntersectsRect(raccoon.frame, raccoonShadow.frame) {
                print("raccoon.")
            }
            if CGRectIntersectsRect(chicken.frame, chickenShadow.frame) {
                print("chicken.")
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

