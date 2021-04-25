//
//  Product.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/25.
//

import Foundation

struct Product {
  let id: UUID = UUID()
  let name: String
  let imageName: String
  let price: Int
  let description: String
  var isFavorite: Bool = false
}

extension Product: Codable {}
extension Product: Identifiable {}
extension Product: Equatable {}



