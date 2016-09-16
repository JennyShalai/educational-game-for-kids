//
//  ViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/8/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class AnimalsViewController: UIViewController {

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var menuBar: UINavigationBar!
    @IBOutlet var wrapperView: UIView!
    @IBOutlet weak var greatJobImg: UIImageView!
    
    @IBOutlet weak var chicken: UIImageView!
    @IBOutlet weak var crocodile: UIImageView!
    @IBOutlet weak var cuala: UIImageView!
    @IBOutlet weak var raccoon: UIImageView!
    
    @IBOutlet weak var chickenShadow: UIImageView!
    @IBOutlet weak var raccoonShadow: UIImageView!
    @IBOutlet weak var cualaShadow: UIImageView!
    @IBOutlet weak var crocodileShadow: UIImageView!
    
    var isChickenMoving: Bool = false
    var isCualaMoving: Bool = false
    var isRaccoonMoving: Bool = false
    var isCrocodileMoving: Bool = false
    
    var isChickenMatch: Bool = false
    var isCrocodileMatch: Bool = false
    var isCualaMatch: Bool = false
    var isRaccoonMatch: Bool = false
    
    var isAnimationGoing: Bool = false
    
    let maxIndexZ: CGFloat = 5
    var backgroundColor: UIColor = UIColor.whiteColor()
    
    var cualaPositionX: CGFloat = 0
    var cualaPositionY: CGFloat = 0
    var chickenPositionX: CGFloat = 0
    var chickenPositionY: CGFloat = 0
    var crocodilePositionX: CGFloat = 0
    var crocodilePositionY: CGFloat = 0
    var raccoonPositionX: CGFloat = 0
    var raccoonPositionY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraints()
        self.setDefaultPositions()
        self.setInitialTriggers()
        
        self.backgroundColor = self.wrapperView.backgroundColor!
        self.menuBar.backgroundColor = self.backgroundColor
    }
    
    func setConstraints() {
        
        let heightOfGameArea = self.wrapperView.frame.height - 64
        
        // menu bar up top
        self.menuBar.removeConstraints(self.menuBar.constraints)
        self.menuBar.translatesAutoresizingMaskIntoConstraints = false
        self.menuBar.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 20).active = true
        self.menuBar.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.menuBar.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.menuBar.heightAnchor.constraintEqualToConstant(44).active = true
        
        // kuala
        self.cuala.removeConstraints(self.cuala.constraints)
        self.cuala.translatesAutoresizingMaskIntoConstraints = false
        self.cuala.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).active = true
        self.cuala.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.cuala.heightAnchor.constraintEqualToConstant(70).active = true
        self.cuala.widthAnchor.constraintEqualToConstant(110).active = true
       
        // chicken
        self.chicken.removeConstraints(self.chicken.constraints)
        self.chicken.translatesAutoresizingMaskIntoConstraints = false
        self.chicken.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).active = true
        self.chicken.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.chicken.heightAnchor.constraintEqualToConstant(71).active = true
        self.chicken.widthAnchor.constraintEqualToConstant(71).active = true
        
        // crocodile
        self.crocodile.removeConstraints(self.crocodile.constraints)
        self.crocodile.translatesAutoresizingMaskIntoConstraints = false
        self.crocodile.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).active = true
        self.crocodile.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.crocodile.heightAnchor.constraintEqualToConstant(77).active = true
        self.crocodile.widthAnchor.constraintEqualToConstant(76).active = true
        
        // raccoon
        self.raccoon.removeConstraints(self.raccoon.constraints)
        self.raccoon.translatesAutoresizingMaskIntoConstraints = false
        self.raccoon.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).active = true
        self.raccoon.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.raccoon.heightAnchor.constraintEqualToConstant(70).active = true
        self.raccoon.widthAnchor.constraintEqualToConstant(75).active = true
        
        // kuala shadow
        self.cualaShadow.removeConstraints(self.cualaShadow.constraints)
        self.cualaShadow.translatesAutoresizingMaskIntoConstraints = false
        self.cualaShadow.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).active = true
        self.cualaShadow.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.cualaShadow.heightAnchor.constraintEqualToConstant(70).active = true
        self.cualaShadow.widthAnchor.constraintEqualToConstant(110).active = true
        
        //chicken shadow
        self.chickenShadow.removeConstraints(self.chickenShadow.constraints)
        self.chickenShadow.translatesAutoresizingMaskIntoConstraints = false
        self.chickenShadow.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).active = true
        self.chickenShadow.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.chickenShadow.heightAnchor.constraintEqualToConstant(71).active = true
        self.chickenShadow.widthAnchor.constraintEqualToConstant(71).active = true
        
        // crocodile shadow
        self.crocodileShadow.removeConstraints(self.crocodileShadow.constraints)
        self.crocodileShadow.translatesAutoresizingMaskIntoConstraints = false
        self.crocodileShadow.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).active = true
        self.crocodileShadow.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.crocodileShadow.heightAnchor.constraintEqualToConstant(77).active = true
        self.crocodileShadow.widthAnchor.constraintEqualToConstant(76).active = true
        
        // raccoon shadow
        self.raccoonShadow.removeConstraints(self.raccoonShadow.constraints)
        self.raccoonShadow.translatesAutoresizingMaskIntoConstraints = false
        self.raccoonShadow.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).active = true
        self.raccoonShadow.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.raccoonShadow.heightAnchor.constraintEqualToConstant(70).active = true
        self.raccoonShadow.widthAnchor.constraintEqualToConstant(75).active = true
        
        //  great Job Star
        self.greatJobImg.removeConstraints(greatJobImg.constraints)
        self.greatJobImg.translatesAutoresizingMaskIntoConstraints = false
        self.greatJobImg.centerXAnchor.constraintEqualToAnchor(self.wrapperView.centerXAnchor).active = true
        self.greatJobImg.centerYAnchor.constraintEqualToAnchor(self.wrapperView.centerYAnchor).active = true
        self.greatJobImg.heightAnchor.constraintEqualToConstant(200).active = true
        self.greatJobImg.widthAnchor.constraintEqualToConstant(200).active = true
    }
    
    func setDefaultPositions() {
        // track respond position of an image
        // called after all constraints are set
        print("\(self.cualaPositionX)  \(self.cuala.frame.origin.x)")
        self.cualaPositionX = self.cuala.frame.origin.x
        print("\(self.cualaPositionY)  \(self.cuala.frame.origin.y)")
        self.cualaPositionY = self.cuala.frame.origin.y
         print("\(self.cualaPositionX) ")
         print("\(self.cualaPositionY) ")
        
        self.chickenPositionX = self.chicken.frame.origin.x
        self.chickenPositionY = self.chicken.frame.origin.y
        self.crocodilePositionX = self.crocodile.frame.origin.x
        self.crocodilePositionY = self.crocodile.frame.origin.y
        self.raccoonPositionX = self.raccoon.frame.origin.x
        self.raccoonPositionY = self.raccoon.frame.origin.y
        
    }
    
    func setInitialTriggers() {
        
        // showing images and hidding "Great Job" star
        self.greatJobImg.hidden = true
        self.cualaShadow.hidden = false
        self.crocodileShadow.hidden = false
        self.raccoonShadow.hidden = false
        self.chickenShadow.hidden = false
        self.cuala.hidden = false
        self.crocodile.hidden = false
        self.chicken.hidden = false
        self.raccoon.hidden = false
        
        self.isCualaMoving = false
        self.isChickenMoving = false
        self.isCrocodileMoving = false
        self.isRaccoonMoving = false
        
        // reset matching triggers
        self.isCualaMatch = false
        self.isCrocodileMatch = false
        self.isRaccoonMatch = false
        self.isChickenMatch = false
        
        self.isAnimationGoing = false
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
        
        // reset move activity triggers
        self.isChickenMoving = false
        self.isCrocodileMoving = false
        self.isRaccoonMoving = false
        self.isCualaMoving = false
        
        //set Z-index for image position
        self.cuala.layer.zPosition = 4
        self.chicken.layer.zPosition = 3
        self.crocodile.layer.zPosition = 2
        self.raccoon.layer.zPosition = 1
    }
    
    func checkCollisions() {
        
        // checking collistions between animals images and shadows
        // called after touches ended
        
        // if animal image matchs with it's shadow
        if CGRectIntersectsRect(chicken.frame, chickenShadow.frame) {
            self.chicken.center = self.chickenShadow.center
            self.chickenShadow.hidden = true
            self.isChickenMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(cuala.frame, cualaShadow.frame) {
            self.cuala.center = self.cualaShadow.center
            self.cualaShadow.hidden = true
            self.isCualaMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(crocodile.frame, crocodileShadow.frame) {
            self.crocodile.center = self.crocodileShadow.center
            self.crocodileShadow.hidden = true
            self.isCrocodileMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(raccoon.frame, raccoonShadow.frame) {
            self.raccoon.center = self.raccoonShadow.center
            self.raccoonShadow.hidden = true
            self.isRaccoonMatch = true
            self.matchValidation()
        }
        
        
        // if animal image does not match with shadow, push image back to it's respond place
        if CGRectIntersectsRect(cuala.frame, crocodileShadow.frame) || CGRectIntersectsRect(cuala.frame, raccoonShadow.frame) || CGRectIntersectsRect(cuala.frame, chickenShadow.frame) {
            
            print("\(self.cualaPositionX) ")
            print("\(self.cualaPositionY) ")
            
            self.cuala.frame.origin.x = self.cualaPositionX
            self.cuala.frame.origin.y = self.cualaPositionY
            
            print("\(self.cualaPositionX) ")
            print("\(self.cualaPositionY) ")
        }
        
        if CGRectIntersectsRect(crocodile.frame, cualaShadow.frame) || CGRectIntersectsRect(crocodile.frame, raccoonShadow.frame) || CGRectIntersectsRect(crocodile.frame, chickenShadow.frame) {
            self.crocodile.frame.origin.x = self.crocodilePositionX
            self.crocodile.frame.origin.y = self.crocodilePositionY
        }
        
        if CGRectIntersectsRect(raccoon.frame, cualaShadow.frame) || CGRectIntersectsRect(raccoon.frame, crocodileShadow.frame) || CGRectIntersectsRect(raccoon.frame, chickenShadow.frame) {
            self.raccoon.frame.origin.x = self.raccoonPositionX
            self.raccoon.frame.origin.y = self.raccoonPositionY
        }
        
        if CGRectIntersectsRect(chicken.frame, cualaShadow.frame) || CGRectIntersectsRect(chicken.frame, crocodileShadow.frame) || CGRectIntersectsRect(chicken.frame, raccoonShadow.frame) {
            self.chicken.frame.origin.x = self.chickenPositionX
            self.chicken.frame.origin.y = self.chickenPositionY
        }
    }
    
    func matchValidation() {
        // checking are all animals matching with their shadows
        if !isAnimationGoing {
            
            if self.isCualaMatch && self.isChickenMatch && self.isCrocodileMatch && self.isRaccoonMatch {
                // animating screen background when all images match shadows
                self.isAnimationGoing = true
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.4, blue: 0.4, alpha: 1)
                }) { (Bool) -> Void in
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.wrapperView.backgroundColor = self.backgroundColor
                        }, completion: { (Bool) -> Void in
                            UIView.animateWithDuration(0.2, animations: { () -> Void in
                                self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.4, blue: 0.4, alpha: 1)
                                }, completion: { (Bool) -> Void in
                                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                                        self.wrapperView.backgroundColor = self.backgroundColor
                                        }, completion:nil)
                                    self.isAnimationGoing = false
                            })
                    })
                    
                    
                }
                
                // hide all images
                self.cuala.hidden = true
                self.crocodile.hidden = true
                self.raccoon.hidden = true
                self.chicken.hidden = true
                self.chickenShadow.hidden = true
                self.raccoonShadow.hidden = true
                self.crocodileShadow.hidden = true
                self.cualaShadow.hidden = true
                
                // show the star
                self.greatJobImg.hidden = false
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func doneButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        self.setConstraints()
        self.setInitialTriggers()
    }
}

