//
//  ViewController.swift
//  SwiftyWords
//
//  Created by Ruter on 16/4/18.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var cluesLabel: UILabel!
  @IBOutlet weak var answersLabel: UILabel!
  @IBOutlet weak var currentAnswer: UITextField!
  @IBOutlet weak var scoreLabel: UILabel!
  
  var letterButtons = [UIButton]()
  var activatedButtons = [UIButton]()
  var solutions = [String]()
  
  var score = 0
  var level = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func submitTapped(sender: UIButton) {
  }

  @IBAction func clearTapped(sender: UIButton) {
  }
  
}

