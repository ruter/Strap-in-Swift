//
//  MasterViewController.swift
//  WordScramble
//
//  Created by Ruter on 16/4/15.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

  var objects = [AnyObject]()


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
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

    let object = objects[indexPath.row] as! NSDate
    cell.textLabel!.text = object.description
    return cell
  }

}

