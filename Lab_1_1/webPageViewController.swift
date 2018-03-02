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


    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.frame = view.bounds
        view.addSubview(webView)
        
        let website = "https://www.apple.com"
        let siteURL = NSURL(string: website)
        
        
        let req = NSURLRequest(URL: siteURL as! URL)
        webView?.loadRequest(req)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
