//
//  webPageViewController.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class webPageViewController: UIViewController {

    //var webView : WKWebView!
    
    @IBOutlet weak var webViewP: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webViewP.load(request)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
