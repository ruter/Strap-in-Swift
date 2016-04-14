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
    
    let url = NSURL(string: "https://ruter.github.io")!
    webView.loadRequest(NSURLRequest(URL: url))
    webView.allowsBackForwardNavigationGestures = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

