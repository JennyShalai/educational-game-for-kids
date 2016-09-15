//
//  NumbersViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/10/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var menuBar: UINavigationBar!
    
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
    
    var isAnimationGoing: Bool = false
    
    let maxIndexZ: CGFloat = 5
    var backgroundColor: UIColor = UIColor.whiteColor()
    
    var avocadoPositionX: CGFloat = 0
    var avocadoPositionY: CGFloat = 0
    var orangePositionX: CGFloat = 0
    var orangePositionY: CGFloat = 0
    var fruitPositionX: CGFloat = 0
    var fruitPositionY: CGFloat = 0
    var berryPositionX: CGFloat = 0
    var berryPositionY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraints()
        self.backgroundColor = self.wrapperView.backgroundColor!
        print("red \(self.backgroundColor)")
    }
    
    func setConstraints() {
        
        let heightOfGameArea = self.view.frame.height - 64
        
        // menu bar up top
        self.menuBar.removeConstraints(self.menuBar.constraints)
        self.menuBar.translatesAutoresizingMaskIntoConstraints = false
        self.menuBar.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 20).active = true
        self.menuBar.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.menuBar.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.menuBar.heightAnchor.constraintEqualToConstant(44).active = true
        
        // avocado
        self.avocadoImg.removeConstraints(self.avocadoImg.constraints)
        self.avocadoImg.translatesAutoresizingMaskIntoConstraints = false
        self.avocadoImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).active = true
        self.avocadoImg.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.avocadoImg.heightAnchor.constraintEqualToConstant(82).active = true
        self.avocadoImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // orange
        self.orangeImg.removeConstraints(self.orangeImg.constraints)
        self.orangeImg.translatesAutoresizingMaskIntoConstraints = false
        self.orangeImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).active = true
        self.orangeImg.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.orangeImg.heightAnchor.constraintEqualToConstant(81).active = true
        self.orangeImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // fruit
        self.fruitImg.removeConstraints(self.fruitImg.constraints)
        self.fruitImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).active = true
        self.fruitImg.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.fruitImg.heightAnchor.constraintEqualToConstant(81).active = true
        self.fruitImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // berry
        self.berryImg.removeConstraints(self.berryImg.constraints)
        self.berryImg.translatesAutoresizingMaskIntoConstraints = false
        self.berryImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).active = true
        self.berryImg.centerXAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 65).active = true
        self.berryImg.heightAnchor.constraintEqualToConstant(90).active = true
        self.berryImg.widthAnchor.constraintEqualToConstant(71).active = true
        
        // avocado shadow
        self.avocadoShadowImg.removeConstraints(self.avocadoShadowImg.constraints)
        self.avocadoShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.avocadoShadowImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).active = true
        self.avocadoShadowImg.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.avocadoShadowImg.heightAnchor.constraintEqualToConstant(82).active = true
        self.avocadoShadowImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // orange shadow
        self.orangeShadowImg.removeConstraints(self.orangeShadowImg.constraints)
        self.orangeShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.orangeShadowImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).active = true
        self.orangeShadowImg.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.orangeShadowImg.heightAnchor.constraintEqualToConstant(81).active = true
        self.orangeShadowImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // fruit shadow
        self.fruitShadowImg.removeConstraints(self.fruitShadowImg.constraints)
        self.fruitShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitShadowImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).active = true
        self.fruitShadowImg.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.fruitShadowImg.heightAnchor.constraintEqualToConstant(81).active = true
        self.fruitShadowImg.widthAnchor.constraintEqualToConstant(81).active = true
        
        // berry shadow
        self.berryShadowImg.removeConstraints(self.berryShadowImg.constraints)
        self.berryShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.berryShadowImg.centerYAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).active = true
        self.berryShadowImg.centerXAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -65).active = true
        self.berryShadowImg.heightAnchor.constraintEqualToConstant(90).active = true
        self.berryShadowImg.widthAnchor.constraintEqualToConstant(71).active = true
        
        self.setValuesOfDefaultPositions()
    }
    
    func setValuesOfDefaultPositions() {
        // track respond position of an image
        // called after all constraints are set
        self.avocadoPositionX = self.avocadoImg.frame.origin.x
        self.avocadoPositionY = self.avocadoImg.frame.origin.y
        self.orangePositionX = self.orangeImg.frame.origin.x
        self.orangePositionY = self.orangeImg.frame.origin.y
        self.fruitPositionX = self.fruitImg.frame.origin.x
        self.fruitPositionY = self.fruitImg.frame.origin.y
        self.berryPositionX = self.berryImg.frame.origin.x
        self.berryPositionY = self.berryImg.frame.origin.y
        print("AVOCADO \(self.avocadoImg.frame.origin.x) \(self.avocadoImg.frame.origin.y)")
        print("ORANGE \(self.orangeImg.frame.origin.x) \(self.orangeImg.frame.origin.y)")
        print("FRUIT \(self.fruitImg.frame.origin.x) \(self.fruitImg.frame.origin.y)")
        print("BERRY \(self.berryImg.frame.origin.x) \(self.berryImg.frame.origin.y)")
        
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
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(orangeImg.frame, orangeShadowImg.frame) {
            
            self.orangeImg.center = self.orangeShadowImg.center
            self.orangeShadowImg.hidden = true
            self.isOrangeMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(fruitImg.frame, fruitShadowImg.frame) {
            
            self.fruitImg.center = self.fruitShadowImg.center
            self.fruitShadowImg.hidden = true
            self.isFruitMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(berryImg.frame, berryShadowImg.frame) {
            
            self.berryImg.center = self.berryShadowImg.center
            self.berryShadowImg.hidden = true
            self.isBerryMatch = true
            self.matchValidation()
        }
        
        if CGRectIntersectsRect(avocadoImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(avocadoImg.frame, berryShadowImg.frame) {
            self.avocadoImg.frame.origin.x = self.avocadoPositionX
            self.avocadoImg.frame.origin.y = self.avocadoPositionY
            print("avocado \(self.avocadoImg.frame.origin.x) \(self.avocadoImg.frame.origin.y)")
        }
        
        if CGRectIntersectsRect(orangeImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, fruitShadowImg.frame) || CGRectIntersectsRect(orangeImg.frame, berryShadowImg.frame) {
            self.orangeImg.frame.origin.x = self.orangePositionX
            self.orangeImg.frame.origin.y = self.orangePositionY
            print("orange \(self.orangeImg.frame.origin.x) \(self.orangeImg.frame.origin.y)")
        }
        
        if CGRectIntersectsRect(fruitImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(fruitImg.frame, berryShadowImg.frame) {
            self.fruitImg.frame.origin.x = self.fruitPositionX
            self.fruitImg.frame.origin.y = self.fruitPositionY
            print("fruit \(self.fruitImg.frame.origin.x) \(self.fruitImg.frame.origin.y)")
        }
        
        if CGRectIntersectsRect(berryImg.frame, avocadoShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, orangeShadowImg.frame) || CGRectIntersectsRect(berryImg.frame, fruitShadowImg.frame) {
            self.berryImg.frame.origin.x = self.berryPositionX
            self.berryImg.frame.origin.y = self.berryPositionY
            print("berry \(self.berryImg.frame.origin.x) \(self.berryImg.frame.origin.y)")
        }
    }
    
    func matchValidation() {
        // checking are all fruits matching with their shadows
        if !isAnimationGoing {
            if self.isAvocadoMatch && self.isOrangeMatch && self.isFruitMatch && self.isBerryMatch {
                print("FRUITS MATCHED")
                self.isAnimationGoing = true
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    print("1")
                    self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.839216, blue: 0, alpha: 1)
                }) { (Bool) -> Void in
                    print("2")
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.wrapperView.backgroundColor = self.backgroundColor
                        }, completion: { (Bool) -> Void in
                            print("3")
                            UIView.animateWithDuration(0.2, animations: { () -> Void in
                                self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.839216, blue: 0, alpha: 1)

                                }, completion: { (Bool) -> Void in
                                    print("4")
                                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                                        self.wrapperView.backgroundColor = self.backgroundColor
                                        }, completion:nil)
                            })
                    })
                    self.isAnimationGoing = false
                    
                    
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("ChoiceViewController")
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        self.setConstraints()
        self.avocadoShadowImg.hidden = false
        self.orangeShadowImg.hidden = false
        self.fruitShadowImg.hidden = false
        self.berryShadowImg.hidden = false
        self.isAvocadoMatch = false
        self.isOrangeMatch = false
        self.isFruitMatch = false
        self.isBerryMatch = false
    }
}
