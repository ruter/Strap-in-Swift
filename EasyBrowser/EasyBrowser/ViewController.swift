//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Ruter on 16/4/14.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

  var webView: WKWebView!
  
  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: #selector(openTapped))
    
    let url = NSURL(string: "https://ruter.github.io")!
    webView.loadRequest(NSURLRequest(URL: url))
    webView.allowsBackForwardNavigationGestures = true
  }
  
  func openTapped() {
    let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .ActionSheet)
    ac.addAction(UIAlertAction(title: "apple.com", style: .Default, handler: openPage))
    ac.addAction(UIAlertAction(title: "ruter.github.io", style: .Default, handler: openPage))
    ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    
    presentViewController(ac, animated: true, completion: nil)
  }
  
  func openPage(action: UIAlertAction!) {
    let url = NSURL(string: "https://" + action.title!)!
    webView.loadRequest(NSURLRequest(URL: url))
  }
  
  // MARK: - MKNavigationDelegate
  func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    title = webView.title
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

