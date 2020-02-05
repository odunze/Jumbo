//
//  OperationsView+WebKit.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import UIKit
import WebKit

extension OperationsView: WKScriptMessageHandler {
    
    //Receive Opertation Callback and status
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        vm.receiveMessage(message: message) { status in
            if status == .failure {
                print("Couldn't add operation to array")
            }
            
            if status == .success {
                DispatchQueue.main.async {
                    self.operationTable.reloadData()
                }
            }
        }
    }
}
