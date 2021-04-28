//
//  KoreanViewModel.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI
import RealmSwift

class KoreanViewModel: ObservableObject {
    
    // 설정에서 onDisappear시 koreanViewModel.grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @Published var grade = ""
    @Published var semester = ""
    // Fetched Data
    @Published var curriculums: [Curriculum01] = []
    
    
    init() {
        fetchData()
    }

    // Fetching Data
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(Curriculum01.self)
        self.curriculums = results.compactMap({ (curriculum) -> Curriculum01? in return curriculum })
    }
    
    func deleteData() {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            dbRef.deleteAll()            
            fetchData()
        }
    }
      
}

