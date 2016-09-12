//
//  ChoiceViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/10/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var animalsImg: UIImageView!
    @IBOutlet weak var fruitsImg: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!
    
    let kCornerRadius: CGFloat = 30
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraints()
        self.setZPositions()
        self.setGestures()
        
    }
    
    func setConstraints() {
        
        self.view.removeConstraints(self.view.constraints)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        // leftView yellow side 
        self.leftView.removeConstraints(self.leftView.constraints)
        self.leftView.translatesAutoresizingMaskIntoConstraints = false
        self.leftView.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.leftView.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
        self.leftView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.0).active = true
        self.leftView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.5).active = true
    
        // leftView red side 
        self.rightView.removeConstraints(self.rightView.constraints)
        self.rightView.translatesAutoresizingMaskIntoConstraints = false
        self.rightView.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor).active = true
        self.rightView.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true
        self.rightView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.0).active = true
        self.rightView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.5).active = true
    
        // logo
        self.logoImg.removeConstraints(self.logoImg.constraints)
        self.logoImg.translatesAutoresizingMaskIntoConstraints = false
        self.logoImg.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.logoImg.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 40).active = true
        self.logoImg.heightAnchor.constraintEqualToConstant(60).active = true
        self.logoImg.widthAnchor.constraintEqualToConstant(300).active = true
        
        // text
        self.textView.removeConstraints(self.textView.constraints)
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.textView.topAnchor.constraintEqualToAnchor(self.logoImg.bottomAnchor, constant: 10).active = true
        self.textView.heightAnchor.constraintEqualToConstant(360).active = true
        self.textView.widthAnchor.constraintEqualToConstant(300).active = true
        
        // animals image
        self.animalsImg.removeConstraints(self.animalsImg.constraints)
        self.animalsImg.translatesAutoresizingMaskIntoConstraints = false
        self.animalsImg.centerXAnchor.constraintEqualToAnchor(self.leftView.centerXAnchor).active = true
        self.animalsImg.centerYAnchor.constraintEqualToAnchor(self.leftView.centerYAnchor, constant: 100).active = true
        self.animalsImg.heightAnchor.constraintEqualToConstant(140).active = true
        self.animalsImg.widthAnchor.constraintEqualToConstant(140).active = true
        
        // fruits image
        self.fruitsImg.removeConstraints(self.animalsImg.constraints)
        self.fruitsImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitsImg.centerXAnchor.constraintEqualToAnchor(self.rightView.centerXAnchor).active = true
        self.fruitsImg.centerYAnchor.constraintEqualToAnchor(self.rightView.centerYAnchor, constant: 100).active = true
        self.fruitsImg.heightAnchor.constraintEqualToConstant(140).active = true
        self.fruitsImg.widthAnchor.constraintEqualToConstant(140).active = true
    
    }
    
    func setZPositions() {
        //self.textView.layer.cornerRadius = kCornerRadius
        self.textView.textAlignment = .Center
        self.logoImg.layer.zPosition = 2
        self.leftView.layer.zPosition = 1
        self.rightView.layer.zPosition = 1
        self.animalsImg.layer.zPosition = 2
        self.fruitsImg.layer.zPosition = 2
        self.textView.layer.zPosition = 2
    }
    
    func setGestures() {
        // set tap action for animals image
        let animalsImageView = self.animalsImg
        let tapAnimalsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.animalsImageTapped(_:)))
        animalsImageView.userInteractionEnabled = true
        animalsImageView.addGestureRecognizer(tapAnimalsGestureRecognizer)
        
        // set tap action for numbers image
        let numbersImageView = self.fruitsImg
        let tapFruitsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.fruitsImageTapped(_:)))
        numbersImageView.userInteractionEnabled = true
        numbersImageView.addGestureRecognizer(tapFruitsGestureRecognizer)
        
    }
    
    func animalsImageTapped(img: AnyObject) {
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("AnimalsViewController") 
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    func fruitsImageTapped(img: AnyObject) {
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("FruitsViewController")
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}