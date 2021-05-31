//
//  searchANP.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/29.
//


import SwiftUI
import RealmSwift

class SearchViewModel: ObservableObject {
    @Published var searchedANP: [ANP03] = []
    @Published var query = ""
//    @Published var page = 1

    func find() {
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(ANP03.self).filter("grade contains '\(searchQuery)' or subject contains '\(searchQuery)' or chapName contains '\(searchQuery)' or actName contains '\(searchQuery)' or activity contains '\(searchQuery)' or tip contains '\(searchQuery)'" )

        DispatchQueue.main.async {
            self.searchedANP = results.compactMap({ (anp) -> ANP03? in return anp })
            // removing data if its new request ...
//            if self.page == 1 {
//                self.searchedANP.removeAll()
//            }
            
        }

    }
    
    func reset() {
        self.query = ""
        self.searchedANP.removeAll()
    }
}

