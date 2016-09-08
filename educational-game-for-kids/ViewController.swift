//
//  ViewController.swift
//  educational-game-for-kids
//
//  Created by Flatiron School on 9/8/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenBox: UIImageView!
    @IBOutlet weak var blueBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.greenBox.frame.contains(location) {
                self.greenBox.center = location
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInView(self.view)
            
            if self.greenBox.frame.contains(location) {
                self.greenBox.center = location
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

