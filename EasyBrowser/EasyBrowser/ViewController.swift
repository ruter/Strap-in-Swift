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
  var websites = ["apple.com", "ruter.github.io"]
  
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
    
    let url = NSURL(string: "https://" + websites[0])!
    webView.loadRequest(NSURLRequest(URL: url))
    webView.allowsBackForwardNavigationGestures = true
  }
  
  func openTapped() {
    let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .ActionSheet)
    for website in websites {
      ac.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
    }
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
  
  func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
    let url = navigationAction.request.URL
    
    if let host = url!.host {
      for website in websites {
        if host.rangeOfString(website) != nil {
          decisionHandler(.Allow)
          return
        }
      }
    }
    decisionHandler(.Cancel)
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

