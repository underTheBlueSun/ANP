//
//  ActiveSheet.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/23.
//

import Foundation

enum ActiveSheet: Identifiable {
    case first, second
    var id: Int {
        hashValue
    }
}
