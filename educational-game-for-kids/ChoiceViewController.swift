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
    @IBOutlet weak var fruitsImg: UIImageView!
    
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