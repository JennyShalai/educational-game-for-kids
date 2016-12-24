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
    @IBOutlet weak var greatJobImg: UIImageView!
    
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
    var backgroundColor: UIColor = UIColor.white
    
    var avocadoPositionX: CGFloat = 0
    var avocadoPositionY: CGFloat = 0
    var orangePositionX: CGFloat = 0
    var orangePositionY: CGFloat = 0
    var fruitPositionX: CGFloat = 0
    var fruitPositionY: CGFloat = 0
    var berryPositionX: CGFloat = 0
    var berryPositionY: CGFloat = 0
    
    var heightOfGameArea: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraints()
        self.setInitialTriggers()
        
        self.backgroundColor = self.wrapperView.backgroundColor!
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setDefaultPositions()
    }
    
    func setConstraints() {
        
        heightOfGameArea = self.view.frame.height
        
        //reset storyboard constraints
        self.view.removeConstraints(self.view.constraints)
        
        // wrapper view for all images
        self.wrapperView.removeConstraints(self.wrapperView.constraints)
        self.wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.wrapperView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.wrapperView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.wrapperView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.wrapperView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        // avocado
        self.avocadoImg.removeConstraints(self.avocadoImg.constraints)
        self.avocadoImg.translatesAutoresizingMaskIntoConstraints = false
        self.avocadoImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).isActive = true
        self.avocadoImg.centerXAnchor.constraint(equalTo: self.wrapperView.leftAnchor, constant: 65).isActive = true
        self.avocadoImg.heightAnchor.constraint(equalToConstant: 82).isActive = true
        self.avocadoImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // orange
        self.orangeImg.removeConstraints(self.orangeImg.constraints)
        self.orangeImg.translatesAutoresizingMaskIntoConstraints = false
        self.orangeImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).isActive = true
        self.orangeImg.centerXAnchor.constraint(equalTo: self.wrapperView.leftAnchor, constant: 65).isActive = true
        self.orangeImg.heightAnchor.constraint(equalToConstant: 81).isActive = true
        self.orangeImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // fruit
        self.fruitImg.removeConstraints(self.fruitImg.constraints)
        self.fruitImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).isActive = true
        self.fruitImg.centerXAnchor.constraint(equalTo: self.wrapperView.leftAnchor, constant: 65).isActive = true
        self.fruitImg.heightAnchor.constraint(equalToConstant: 81).isActive = true
        self.fruitImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // berry
        self.berryImg.removeConstraints(self.berryImg.constraints)
        self.berryImg.translatesAutoresizingMaskIntoConstraints = false
        self.berryImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).isActive = true
        self.berryImg.centerXAnchor.constraint(equalTo: self.wrapperView.leftAnchor, constant: 65).isActive = true
        self.berryImg.heightAnchor.constraint(equalToConstant: 90).isActive = true
        self.berryImg.widthAnchor.constraint(equalToConstant: 71).isActive = true
        
        // avocado shadow
        self.avocadoShadowImg.removeConstraints(self.avocadoShadowImg.constraints)
        self.avocadoShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.avocadoShadowImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).isActive = true
        self.avocadoShadowImg.centerXAnchor.constraint(equalTo: self.wrapperView.rightAnchor, constant: -65).isActive = true
        self.avocadoShadowImg.heightAnchor.constraint(equalToConstant: 82).isActive = true
        self.avocadoShadowImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // orange shadow
        self.orangeShadowImg.removeConstraints(self.orangeShadowImg.constraints)
        self.orangeShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.orangeShadowImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).isActive = true
        self.orangeShadowImg.centerXAnchor.constraint(equalTo: self.wrapperView.rightAnchor, constant: -65).isActive = true
        self.orangeShadowImg.heightAnchor.constraint(equalToConstant: 81).isActive = true
        self.orangeShadowImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // fruit shadow
        self.fruitShadowImg.removeConstraints(self.fruitShadowImg.constraints)
        self.fruitShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitShadowImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).isActive = true
        self.fruitShadowImg.centerXAnchor.constraint(equalTo: self.wrapperView.rightAnchor, constant: -65).isActive = true
        self.fruitShadowImg.heightAnchor.constraint(equalToConstant: 81).isActive = true
        self.fruitShadowImg.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        // berry shadow
        self.berryShadowImg.removeConstraints(self.berryShadowImg.constraints)
        self.berryShadowImg.translatesAutoresizingMaskIntoConstraints = false
        self.berryShadowImg.centerYAnchor.constraint(equalTo: self.wrapperView.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).isActive = true
        self.berryShadowImg.centerXAnchor.constraint(equalTo: self.wrapperView.rightAnchor, constant: -65).isActive = true
        self.berryShadowImg.heightAnchor.constraint(equalToConstant: 90).isActive = true
        self.berryShadowImg.widthAnchor.constraint(equalToConstant: 71).isActive = true
        
        //  great Job Star
        self.greatJobImg.removeConstraints(greatJobImg.constraints)
        self.greatJobImg.translatesAutoresizingMaskIntoConstraints = false
        self.greatJobImg.centerXAnchor.constraint(equalTo: self.wrapperView.centerXAnchor).isActive = true
        self.greatJobImg.centerYAnchor.constraint(equalTo: self.wrapperView.centerYAnchor).isActive = true
        self.greatJobImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.greatJobImg.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setDefaultPositions() {
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
    }
    
    func setInitialTriggers() {
        
        // showing images and hidding "Great Job" star
        self.greatJobImg.isHidden = true
        self.avocadoShadowImg.isHidden = false
        self.orangeShadowImg.isHidden = false
        self.fruitShadowImg.isHidden = false
        self.berryShadowImg.isHidden = false
        self.avocadoImg.isHidden = false
        self.orangeImg.isHidden = false
        self.fruitImg.isHidden = false
        self.berryImg.isHidden = false
        
        self.isAvocadoMoving = false
        self.isOrangeMoving = false
        self.isFruitMoving = false
        self.isBerryMoving = false
        
        // reset matching triggers
        self.isAvocadoMatch = false
        self.isOrangeMatch = false
        self.isFruitMatch = false
        self.isBerryMatch = false
        
        self.isAnimationGoing = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self.view)
            
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
            
            if self.greatJobImg.frame.contains(location) && !self.greatJobImg.isHidden {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self.view)
            
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.checkCollisions()
        
        // reset move activity triggers
        self.isAvocadoMoving = false
        self.isOrangeMoving = false
        self.isFruitMoving = false
        self.isBerryMoving = false
        
        //set Z-index for image position
        self.greatJobImg.layer.zPosition = 7
        self.avocadoImg.layer.zPosition = 4
        self.orangeImg.layer.zPosition = 3
        self.fruitImg.layer.zPosition = 2
        self.berryImg.layer.zPosition = 1
    }
    
    func checkCollisions() {
        
        // checking collistions between fruits images and shadows
        // called after touches ended
        
        // if fruits image matchs with it's shadow
        
        if avocadoImg.frame.intersects(avocadoShadowImg.frame) {
            self.avocadoImg.center = self.avocadoShadowImg.center
            self.avocadoShadowImg.isHidden = true
            self.isAvocadoMatch = true
            self.matchValidation()
        }
        
        if orangeImg.frame.intersects(orangeShadowImg.frame) {
            self.orangeImg.center = self.orangeShadowImg.center
            self.orangeShadowImg.isHidden = true
            self.isOrangeMatch = true
            self.matchValidation()
        }
        
        if fruitImg.frame.intersects(fruitShadowImg.frame) {
            self.fruitImg.center = self.fruitShadowImg.center
            self.fruitShadowImg.isHidden = true
            self.isFruitMatch = true
            self.matchValidation()
        }
        
        if berryImg.frame.intersects(berryShadowImg.frame) {
            self.berryImg.center = self.berryShadowImg.center
            self.berryShadowImg.isHidden = true
            self.isBerryMatch = true
            self.matchValidation()
        }
        
        if avocadoImg.frame.intersects(orangeShadowImg.frame) || avocadoImg.frame.intersects(fruitShadowImg.frame) || avocadoImg.frame.intersects(berryShadowImg.frame) {
            self.avocadoImg.frame.origin.x = self.avocadoPositionX
            self.avocadoImg.frame.origin.y = self.avocadoPositionY
        }
        
        if orangeImg.frame.intersects(avocadoShadowImg.frame) || orangeImg.frame.intersects(fruitShadowImg.frame) || orangeImg.frame.intersects(berryShadowImg.frame) {
            self.orangeImg.frame.origin.x = self.orangePositionX
            self.orangeImg.frame.origin.y = self.orangePositionY
        }
        
        if fruitImg.frame.intersects(avocadoShadowImg.frame) || fruitImg.frame.intersects(orangeShadowImg.frame) || fruitImg.frame.intersects(berryShadowImg.frame) {
            self.fruitImg.frame.origin.x = self.fruitPositionX
            self.fruitImg.frame.origin.y = self.fruitPositionY
        }
        
        if berryImg.frame.intersects(avocadoShadowImg.frame) || berryImg.frame.intersects(orangeShadowImg.frame) || berryImg.frame.intersects(fruitShadowImg.frame) {
            self.berryImg.frame.origin.x = self.berryPositionX
            self.berryImg.frame.origin.y = self.berryPositionY
        }
    }
    
    func matchValidation() {
        // checking are all fruits matching with their shadows
        if !isAnimationGoing {
            
            if self.isAvocadoMatch && self.isOrangeMatch && self.isFruitMatch && self.isBerryMatch {
                // animating screen background when all images match shadows
                self.isAnimationGoing = true
                
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.839216, blue: 0, alpha: 1)
                }, completion: { (true) -> Void in
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        self.wrapperView.backgroundColor = self.backgroundColor
                        }, completion: { (true) -> Void in
                            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                                self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.839216, blue: 0, alpha: 1)
                                }, completion: { (true) -> Void in
                                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                                        self.wrapperView.backgroundColor = self.backgroundColor
                                        }, completion:nil)
                                    self.isAnimationGoing = false
                            })
                    })
                }) 
                
                // hide all images
                self.avocadoShadowImg.isHidden = true
                self.orangeShadowImg.isHidden = true
                self.fruitShadowImg.isHidden = true
                self.berryShadowImg.isHidden = true
                self.avocadoImg.isHidden = true
                self.orangeImg.isHidden = true
                self.fruitImg.isHidden = true
                self.berryImg.isHidden = true
                
                // show the star
                self.greatJobImg.isHidden = false
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
