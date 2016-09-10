//
//  ChoiceViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/10/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var animalsImg: UIImageView!
    @IBOutlet weak var numbersImg: UIImageView!
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGestures()
    }
    
    func setGestures() {
        // set tap action for animals image
        let animalsImageView = self.animalsImg
        let tapAnimalsGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.animalsImageTapped(_:)))
        animalsImageView.userInteractionEnabled = true
        animalsImageView.addGestureRecognizer(tapAnimalsGestureRecognizer)
        
        // set tap action for numbers image
        let numbersImageView = self.numbersImg
        let tapNumbersGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ChoiceViewController.numbersImageTapped(_:)))
        numbersImageView.userInteractionEnabled = true
        numbersImageView.addGestureRecognizer(tapNumbersGestureRecognizer)
        
    }
    
    func animalsImageTapped(img: AnyObject) {
        print("ANIMALS WORK!")
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("AnimalsViewController") 
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    func numbersImageTapped(img: AnyObject) {
        print("NUMBERS WORK!")
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("NumbersViewController")
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}