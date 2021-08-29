//
//  WebViewController.swift
//  AppleNewsFeed
//
//  Created by linda.zande on 11/08/2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var urlString = String()

  
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web"
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
      
    }
    
    func webView(_ webVie: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("navigation starts")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("navigation stops")
    }


}
