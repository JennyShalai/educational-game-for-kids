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
    var backgroundColor: UIColor = UIColor.white
    
    var cualaPositionX: CGFloat = 0
    var cualaPositionY: CGFloat = 0
    var chickenPositionX: CGFloat = 0
    var chickenPositionY: CGFloat = 0
    var crocodilePositionX: CGFloat = 0
    var crocodilePositionY: CGFloat = 0
    var raccoonPositionX: CGFloat = 0
    var raccoonPositionY: CGFloat = 0
    
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
        
        heightOfGameArea = self.wrapperView.frame.height
        
        //reset storyboard constraints
        self.view.removeConstraints(self.view.constraints)
        
        // kuala
        self.cuala.removeConstraints(self.cuala.constraints)
        self.cuala.translatesAutoresizingMaskIntoConstraints = false
        self.cuala.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).isActive = true
        self.cuala.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: 65).isActive = true
        self.cuala.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.cuala.widthAnchor.constraint(equalToConstant: 110).isActive = true
       
        // chicken
        self.chicken.removeConstraints(self.chicken.constraints)
        self.chicken.translatesAutoresizingMaskIntoConstraints = false
        self.chicken.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).isActive = true
        self.chicken.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: 65).isActive = true
        self.chicken.heightAnchor.constraint(equalToConstant: 71).isActive = true
        self.chicken.widthAnchor.constraint(equalToConstant: 71).isActive = true
        
        // crocodile
        self.crocodile.removeConstraints(self.crocodile.constraints)
        self.crocodile.translatesAutoresizingMaskIntoConstraints = false
        self.crocodile.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).isActive = true
        self.crocodile.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: 65).isActive = true
        self.crocodile.heightAnchor.constraint(equalToConstant: 77).isActive = true
        self.crocodile.widthAnchor.constraint(equalToConstant: 76).isActive = true
        
        // raccoon
        self.raccoon.removeConstraints(self.raccoon.constraints)
        self.raccoon.translatesAutoresizingMaskIntoConstraints = false
        self.raccoon.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).isActive = true
        self.raccoon.centerXAnchor.constraint(equalTo: self.view.leftAnchor, constant: 65).isActive = true
        self.raccoon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.raccoon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        // kuala shadow
        self.cualaShadow.removeConstraints(self.cualaShadow.constraints)
        self.cualaShadow.translatesAutoresizingMaskIntoConstraints = false
        self.cualaShadow.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.2 * -1).isActive = true
        self.cualaShadow.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: -65).isActive = true
        self.cualaShadow.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.cualaShadow.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        //chicken shadow
        self.chickenShadow.removeConstraints(self.chickenShadow.constraints)
        self.chickenShadow.translatesAutoresizingMaskIntoConstraints = false
        self.chickenShadow.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.4 * -1).isActive = true
        self.chickenShadow.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: -65).isActive = true
        self.chickenShadow.heightAnchor.constraint(equalToConstant: 71).isActive = true
        self.chickenShadow.widthAnchor.constraint(equalToConstant: 71).isActive = true
        
        // crocodile shadow
        self.crocodileShadow.removeConstraints(self.crocodileShadow.constraints)
        self.crocodileShadow.translatesAutoresizingMaskIntoConstraints = false
        self.crocodileShadow.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.8 * -1).isActive = true
        self.crocodileShadow.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: -65).isActive = true
        self.crocodileShadow.heightAnchor.constraint(equalToConstant: 77).isActive = true
        self.crocodileShadow.widthAnchor.constraint(equalToConstant: 76).isActive = true
        
        // raccoon shadow
        self.raccoonShadow.removeConstraints(self.raccoonShadow.constraints)
        self.raccoonShadow.translatesAutoresizingMaskIntoConstraints = false
        self.raccoonShadow.centerYAnchor.constraint(equalTo: self.view.bottomAnchor, constant: heightOfGameArea * 0.6 * -1).isActive = true
        self.raccoonShadow.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: -65).isActive = true
        self.raccoonShadow.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.raccoonShadow.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
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
        self.cualaPositionX = self.cuala.frame.origin.x
        self.cualaPositionY = self.cuala.frame.origin.y
        self.chickenPositionX = self.chicken.frame.origin.x
        self.chickenPositionY = self.chicken.frame.origin.y
        self.crocodilePositionX = self.crocodile.frame.origin.x
        self.crocodilePositionY = self.crocodile.frame.origin.y
        self.raccoonPositionX = self.raccoon.frame.origin.x
        self.raccoonPositionY = self.raccoon.frame.origin.y
    }
    
    func setInitialTriggers() {
        
        // showing images and hidding "Great Job" star
        self.greatJobImg.isHidden = true
        self.cualaShadow.isHidden = false
        self.crocodileShadow.isHidden = false
        self.raccoonShadow.isHidden = false
        self.chickenShadow.isHidden = false
        self.cuala.isHidden = false
        self.crocodile.isHidden = false
        self.chicken.isHidden = false
        self.raccoon.isHidden = false
        
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self.view)
           
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
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self.view)
            
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        if chicken.frame.intersects(chickenShadow.frame) {
            self.chicken.center = self.chickenShadow.center
            self.chickenShadow.isHidden = true
            self.isChickenMatch = true
            self.matchValidation()
        }
        
        if cuala.frame.intersects(cualaShadow.frame) {
            self.cuala.center = self.cualaShadow.center
            self.cualaShadow.isHidden = true
            self.isCualaMatch = true
            self.matchValidation()
        }
        
        if crocodile.frame.intersects(crocodileShadow.frame) {
            self.crocodile.center = self.crocodileShadow.center
            self.crocodileShadow.isHidden = true
            self.isCrocodileMatch = true
            self.matchValidation()
        }
        
        if raccoon.frame.intersects(raccoonShadow.frame) {
            self.raccoon.center = self.raccoonShadow.center
            self.raccoonShadow.isHidden = true
            self.isRaccoonMatch = true
            self.matchValidation()
        }
        
        
        // if animal image does not match with shadow, push image back to it's respond place
        if cuala.frame.intersects(crocodileShadow.frame) || cuala.frame.intersects(raccoonShadow.frame) || cuala.frame.intersects(chickenShadow.frame) {
            print("!! \(cuala.frame.origin.x) \(cuala.frame.origin.y)")
            
            self.cuala.frame.origin.x = self.cualaPositionX
            self.cuala.frame.origin.y = self.cualaPositionY
            
            print("!! \(cuala.frame.origin.x) \(cuala.frame.origin.y)")
        }
        
        if crocodile.frame.intersects(cualaShadow.frame) || crocodile.frame.intersects(raccoonShadow.frame) || crocodile.frame.intersects(chickenShadow.frame) {
            self.crocodile.frame.origin.x = self.crocodilePositionX
            self.crocodile.frame.origin.y = self.crocodilePositionY
        }
        
        if raccoon.frame.intersects(cualaShadow.frame) || raccoon.frame.intersects(crocodileShadow.frame) || raccoon.frame.intersects(chickenShadow.frame) {
            self.raccoon.frame.origin.x = self.raccoonPositionX
            self.raccoon.frame.origin.y = self.raccoonPositionY
        }
        
        if chicken.frame.intersects(cualaShadow.frame) || chicken.frame.intersects(crocodileShadow.frame) || chicken.frame.intersects(raccoonShadow.frame) {
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
                
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.4, blue: 0.4, alpha: 1)
                }, completion: { (Bool) -> Void in
                    UIView.animate(withDuration: 0.2, animations: { () -> Void in
                        self.wrapperView.backgroundColor = self.backgroundColor
                        }, completion: { (Bool) -> Void in
                            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                                self.wrapperView.backgroundColor = UIColor.init(red: 1, green: 0.4, blue: 0.4, alpha: 1)
                                }, completion: { (Bool) -> Void in
                                    UIView.animate(withDuration: 0.2, animations: { () -> Void in
                                        self.wrapperView.backgroundColor = self.backgroundColor
                                        }, completion:nil)
                                    self.isAnimationGoing = false
                            })
                    })
                    
                    
                }) 
                
                // hide all images
                self.cuala.isHidden = true
                self.crocodile.isHidden = true
                self.raccoon.isHidden = true
                self.chicken.isHidden = true
                self.chickenShadow.isHidden = true
                self.raccoonShadow.isHidden = true
                self.crocodileShadow.isHidden = true
                self.cualaShadow.isHidden = true
                
                // show the star
                self.greatJobImg.isHidden = false
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

