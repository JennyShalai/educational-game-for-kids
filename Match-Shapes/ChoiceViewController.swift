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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraints()
        self.setZPositions()
        self.setGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear \(self.view.frame)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear \(self.view.frame)")
    }
    
    func setConstraints() {
        
        //reset storyboard constraints
        self.view.removeConstraints(self.view.constraints)
        
        // leftView yellow side
        self.leftView.removeConstraints(self.leftView.constraints)
        self.leftView.translatesAutoresizingMaskIntoConstraints = false
        self.leftView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.leftView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.leftView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        self.leftView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    
        // leftView red side 
        self.rightView.removeConstraints(self.rightView.constraints)
        self.rightView.translatesAutoresizingMaskIntoConstraints = false
        self.rightView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.rightView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.rightView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        self.rightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    
        // logo
        self.logoImg.removeConstraints(self.logoImg.constraints)
        self.logoImg.translatesAutoresizingMaskIntoConstraints = false
        self.logoImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.logoImg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        self.logoImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.logoImg.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // text
        self.textView.removeConstraints(self.textView.constraints)
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.textView.topAnchor.constraint(equalTo: self.logoImg.bottomAnchor, constant: 10).isActive = true
        self.textView.bottomAnchor.constraint(equalTo: self.animalsImg.topAnchor).isActive = true
        //self.textView.heightAnchor.constraintEqualToConstant(360).active = true
        self.textView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // animals image
        self.animalsImg.removeConstraints(self.animalsImg.constraints)
        self.animalsImg.translatesAutoresizingMaskIntoConstraints = false
        self.animalsImg.centerXAnchor.constraint(equalTo: self.leftView.centerXAnchor).isActive = true
        self.animalsImg.centerYAnchor.constraint(equalTo: self.leftView.centerYAnchor, constant: 100).isActive = true
        self.animalsImg.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.animalsImg.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        // fruits image
        self.fruitsImg.removeConstraints(self.fruitsImg.constraints)
        self.fruitsImg.translatesAutoresizingMaskIntoConstraints = false
        self.fruitsImg.centerXAnchor.constraint(equalTo: self.rightView.centerXAnchor).isActive = true
        self.fruitsImg.centerYAnchor.constraint(equalTo: self.rightView.centerYAnchor, constant: 100).isActive = true
        self.fruitsImg.heightAnchor.constraint(equalToConstant: 140).isActive = true
        self.fruitsImg.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        //self.view.layoutIfNeeded()
    }
    
    func setZPositions() {
        self.textView.textAlignment = .center
        self.logoImg.layer.zPosition = 2
        self.leftView.layer.zPosition = 1
        self.rightView.layer.zPosition = 1
        self.animalsImg.layer.zPosition = 2
        self.fruitsImg.layer.zPosition = 2
        self.textView.layer.zPosition = 2
    }
    
    func setGestures() {
        // set tap action for animals image
        let animalsImageView = self.leftView
        let tapAnimalsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.animalsImageTapped(_:)))
        animalsImageView?.isUserInteractionEnabled = true
        animalsImageView?.addGestureRecognizer(tapAnimalsGestureRecognizer)
        
        // set tap action for numbers image
        let numbersImageView = self.rightView
        let tapFruitsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.fruitsImageTapped(_:)))
        numbersImageView?.isUserInteractionEnabled = true
        numbersImageView?.addGestureRecognizer(tapFruitsGestureRecognizer)
    }
    
    func animalsImageTapped(_ img: AnyObject) {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "AnimalsViewController")
        self.present(nextViewController, animated:true, completion:nil)
    }

    func fruitsImageTapped(_ img: AnyObject) {
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "FruitsViewController")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
