//
//  KoreanViewModel.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..
import SwiftUI
import RealmSwift

class KoreanViewModel: ObservableObject {
    
    @Published var grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @Published var semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
    @Published var chapter = 0
    @Published var koreans: [ANP03] = []

//    init() {
//        fetchKorData()
//    } 
    func fetchKorData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(ANP03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '국어' and chapter == \(chapter) ")
        self.koreans = results.compactMap({ (korean) -> ANP03? in return korean })
    }
      
}
