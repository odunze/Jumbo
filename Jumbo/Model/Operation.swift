//
//  Operation.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import Foundation

struct Operation: Codable {
    var id: String
    var message: String
    var progress: Int?
    var state: String?
    
    var currentProgress: Float? {
        if let prgrs = progress {
            let prgrsFloat = Float(prgrs)
            let currentProgress = prgrsFloat / 100
        return currentProgress
        } else {
            return nil
        }
    }
}

enum Status {
    case success
    case failure
}
