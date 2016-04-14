//
//  DetailViewController.swift
//  SocialMedia
//
//  Created by Ruter on 16/4/14.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit
import Social

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
    // Can set selector as shareToFB
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))
    
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
  
  func shareTapped() {
    let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    
    presentViewController(vc, animated: true, completion: nil)
  }
  
  func shareToFB() {
    let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
    vc.setInitialText("Hey! This picture is great!")
    vc.addImage(detailImageView.image!)
    vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
    
    presentViewController(vc, animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
