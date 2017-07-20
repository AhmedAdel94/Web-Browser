//
//  ViewController.swift
//  Web Browser
//
//  Created by Ahmed Adel on 7/20/17.
//  Copyright © 2017 Ahmed Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UIWebViewDelegate {
    
    
    @IBOutlet var serachBar: UISearchBar!
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func Back(_ sender: UIBarButtonItem) {
        if webView.canGoBack
        {
            webView.goBack()
        }else{
            
        }
    }
    

    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    
    @IBAction func next(_ sender: UIBarButtonItem) {
        if webView.canGoForward{
            webView.goForward()
        }else{
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let url = URL(string: searchBar.text!){
            webView.loadRequest(URLRequest(url: url))
        }else{
            print("Error")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

