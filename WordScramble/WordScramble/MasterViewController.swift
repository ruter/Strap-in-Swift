//
//  MasterViewController.swift
//  WordScramble
//
//  Created by Ruter on 16/4/15.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit
import GameplayKit

class MasterViewController: UITableViewController {

  var allWords = [String]()
  var objects = [String]()


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(promptForAnswer))
    
    if let startWordsPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt") {
      // I can't find this method /*String(contentsOfFile:, usedEncoding:)*/, but it works!??
      if let startWords = try? String(contentsOfFile: startWordsPath, usedEncoding: nil) {
        allWords = startWords.componentsSeparatedByString("\n")
      }
    } else {
      allWords = ["silkworm"]
    }
    
    startGame()
  }
  
  func wordIsPossible(word: String) -> Bool {
    return true
  }
  
  func wordIsOriginal(word: String) -> Bool {
    return true
  }
  
  func wordIsReal(word: String) -> Bool {
    return true
  }
  
  func submitAnswer(answer: String) {
    let lowerAnswer = answer.lowercaseString
    
    if wordIsPossible(lowerAnswer) {
      if wordIsOriginal(lowerAnswer) {
        if wordIsReal(lowerAnswer) {
          objects.insert(answer, atIndex: 0)
          
          let indexPath = NSIndexPath(forRow: 0, inSection: 0)
          tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
      }
    }
  }
  
  func promptForAnswer() {
    let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .Alert)
    ac.addTextFieldWithConfigurationHandler(nil)
    
    let submitAction = UIAlertAction(title: "Submit", style: .Default) { [unowned self, ac] _ in
      let answer = ac.textFields![0]
      self.submitAnswer(answer.text!)
    }
    ac.addAction(submitAction)
    
    presentViewController(ac, animated: true, completion: nil)
  }
  
  func startGame() {
    allWords = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(allWords) as! [String]
    title = allWords[0]
    objects.removeAll(keepCapacity: true)
    tableView.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table View

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

    let object = objects[indexPath.row]
    cell.textLabel!.text = object
    return cell
  }

}

