//
//  webViewController.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {

    //@IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView: WKWebView!
    
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print (link)
        guard let str:String = link else{
            fatalError("You have a probleb")
        }
        let url = URL (string: str)
        let request = URLRequest(url:url!)
        webView.load(request)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
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
