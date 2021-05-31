//
//  SearchUser.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/29.
//

import SwiftUI
import RealmSwift

class SearchUser: ObservableObject {
    @Published var searchedANP: [ANP03] = []
    // user query ...
    @Published var query = ""
    // current result page ...
    @Published var page = 1
    
//    @Published var anps: [ANP03] = []
    
    func find() {
        // removing space ...
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
//        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: URL(string: url)!) { (data, _, err) in
//            guard let jsonData = data else {return}
//            do {
//                let users = try JSONDecoder().decode(Results.self, from: jsonData)
//                // appending to searched users ...
//                DispatchQueue.main.async {
//                    // removing data if its new request ...
//                    if self.page == 1 {
//                        self.searchedANP.removeAll()
//                    }
//                    self.searchedANP.append(contentsOf: users.items)
//                }
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        } // session
//        .resume()
        
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(ANP03.self).filter("grade contains '\(searchQuery)' or subject contains '\(searchQuery)' or chapName contains '\(searchQuery)' or actName contains '\(searchQuery)' or activity contains '\(searchQuery)' or tip contains '\(searchQuery)'" )
//        self.anps = results.compactMap({ (anp) -> ANP03? in return anp })
        
        
        DispatchQueue.main.async {
//            // removing data if its new request ...
//            if self.page == 1 {
//                self.searchedANP.removeAll()
//            }

            self.searchedANP = results.compactMap({ (anp) -> ANP03? in return anp })
        }
        
        
    } // find()
}

