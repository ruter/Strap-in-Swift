//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Ruter on 16/4/13.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  
  var countries = [String]()
  var correctAnswer = 0
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    button1.layer.borderColor = UIColor.lightGrayColor().CGColor
    button2.layer.borderColor = UIColor.lightGrayColor().CGColor
    button3.layer.borderColor = UIColor.lightGrayColor().CGColor
    
    askQuestion()
    
  }
  
  func askQuestion(action: UIAlertAction! = nil) {
    // Shuffling objects in array
    countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
    
    button1.setImage(UIImage(named: countries[0]), forState: .Normal)
    button2.setImage(UIImage(named: countries[1]), forState: .Normal)
    button3.setImage(UIImage(named: countries[2]), forState: .Normal)
    // Generate a random number between 0 and (upper bound - 1)
    correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
    
    // Set title for navigation bar
    title = countries[correctAnswer].uppercaseString
  }
  
  @IBAction func buttonTapped(sender: UIButton) {
    var title: String
    
    if sender.tag == correctAnswer {
      title = "Correct"
      score += 1
    } else {
      title = "Wrong"
      score -= 1
    }
    
    let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
    
    presentViewController(ac, animated: true, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

