//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Ruter on 16/4/12.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var detailImageView: UIImageView!
  
  var didTapped = false

  var detailItem: String? {
    didSet {
        // Update the view.
        self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let detail = self.detailItem {
      self.title = detail
        if let imageView = self.detailImageView {
            imageView.image = UIImage(named: detail)
        }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    self.view.addGestureRecognizer(tapGestureRecognizer)
  }
  
  func handleTap(sender: UITapGestureRecognizer) {
    if sender.state == .Ended {
      if didTapped {
        didTapped = false
        self.view.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBarHidden = false
      } else {
        didTapped = true
        self.view.backgroundColor = UIColor.blackColor()
        navigationController?.navigationBarHidden = true
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

