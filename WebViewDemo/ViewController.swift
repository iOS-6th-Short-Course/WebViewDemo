//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Chhaileng Peng on 12/8/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    @IBAction func forwardClick(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func backwardClick(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let url = URL(string: "http://\(websiteTextField.text!)")
        let request = URLRequest(url: url!)
        webView.load(request)
        websiteTextField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        websiteTextField.delegate = self
        
        let htmlString = """
                        <h1>Hello world</h1>
                        <p>Hello <b>Bro</b></p>
                        <img src="https://www.catster.com/wp-content/uploads/2018/07/Savannah-cat-long-body-shot.jpg" alt="">
                        <ol>
                          <li>Hello</li>
                          <li>World</li>
                        </ol>
        """
        
        webView.loadHTMLString(htmlString, baseURL: nil)
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        websiteTextField.text = "\(webView.url!.absoluteString)"
    }

}

