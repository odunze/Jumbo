//
//  OperationsViewController.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import UIKit
import WebKit

class OperationsView: UIViewController {
    
    //Properties
    lazy var vm = OperationsViewModel()
    
    lazy var cellIdentifier = "operationCell"
    
    lazy var newOpButton = UIBarButtonItem(title: "Add New", style: .plain, target: self, action: #selector(addOperation))
    
    lazy var operationTable: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.rowHeight = 120
        table.backgroundColor = .lightGray
        table.separatorColor = .white
        table.dataSource = self
        table.register(OperationCell.self, forCellReuseIdentifier: cellIdentifier)
        return table
    }()
    
    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let controller = WKUserContentController()
        
        //Adding the message handler the JS is looking for.
        controller.add(self, name: "jumbo")
        configuration.userContentController = controller
        
        let wview = WKWebView(frame: .zero, configuration: configuration)
        wview.isHidden = true
        
        return wview
    }()

    //View Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.titleView = vm.logo
        navigationItem.rightBarButtonItem = newOpButton
        view.addSubview(operationTable)
        
        if let html = vm.createHTMLFile() {
            let request = URLRequest(url: html)
            
            DispatchQueue.main.async {
                self.webView.load(request)
                self.view.addSubview(self.webView)
            }
        }
    }
    
    //Evaluate JS File
    func startOperation(id: String) {
        webView.evaluateJavaScript("startOperation(\"\(id)\")") { (result, error) in
            if let jsError = error {
                print(jsError.localizedDescription)
            }
        }
    }
    
    //Add Operations by Clicking Button
    @objc func addOperation(){
        let id = vm.randomise()
        startOperation(id: id)
    }
}
