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
}

enum Status {
    case success
    case failure
}
