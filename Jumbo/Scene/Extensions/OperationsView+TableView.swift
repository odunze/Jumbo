//
//  OperationsView+TableView.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import UIKit

extension OperationsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OperationCell
        
        if vm.operations.count > 0 {
        
        cell.idLabel.text = "ID: \(vm.operations[indexPath.row].id)"
        
        switch vm.operations[indexPath.row].state {
        case "success":
            cell.statusLabel.text = "Successful Operation!"
        case "error":
            cell.statusLabel.text = "Operation Failed!"
        default:
            cell.statusLabel.text = "Currently in Progress"
        }
            
        cell.progressBar.setProgress(vm.operations[indexPath.row].currentProgress ?? 0, animated: true)
            
        }
        
        return cell
    }
}
