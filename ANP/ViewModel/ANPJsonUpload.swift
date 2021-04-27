//
//  ANPJsonUpload.swift
//  ANP
//
//  Created by macbook on 2021/04/27.
//

import Foundation

final class ANPJsonUpload: ObservableObject {
  
  @Published var anps: [ANP01]

  init(filename: String = "ANPData.json") {
    self.anps = Bundle.main.decode(filename: filename, as: [ANP01].self)
    
  }
}
