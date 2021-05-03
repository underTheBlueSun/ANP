//
//  ANPViewModel.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..
import SwiftUI
import RealmSwift

class ANPViewModel: ObservableObject {
    
    @Published var grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @Published var semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
    @Published var subject = ""
    @Published var chapter = 0
    @Published var chapName = ""
    @Published var page = 0
    @Published var time = ""
    @Published var actName = ""
    @Published var needs = ""
    @Published var activity = ""
    @Published var tip = ""
    @Published var picture = ""
    @Published var range = "짝"
    
    @Published var anps: [ANP03] = []

//    init() {
//        fetchKorData()
//    }
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(ANP03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '\(subject)' and chapter == \(chapter) ")
        self.anps = results.compactMap({ (anp) -> ANP03? in return anp })
    }
      
}
