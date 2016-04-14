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
  var progressView: UIProgressView!
  
  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: #selector(openTapped))
    
    progressView = UIProgressView(progressViewStyle: .Default)
    progressView.sizeToFit()
    let progressButton = UIBarButtonItem(customView: progressView)
    
    
    let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: #selector(UIWebView.reload))
    
    toolbarItems = [progressButton, spacer, refresh]
    navigationController?.toolbarHidden = false
    
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
  
  // MARK: - KVO
  override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if keyPath == "estimatedProgress" {
      progressView.progress = Float(webView.estimatedProgress)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

