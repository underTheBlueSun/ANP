//
//  CurriculumViewModel.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..

import SwiftUI
import RealmSwift

class CurriculumViewModel: ObservableObject {
    
    @Published var grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @Published var semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
//    @Published var curriculums: [Curriculum03] = []
    @Published var koreans: [Curriculum03] = []
    @Published var maths: [Curriculum03] = []
    @Published var societys: [Curriculum03] = []
    @Published var sciences: [Curriculum03] = []
    
    init() {
        fetchKorData()
        fetchMathData()
        fetchSocietyData()
        fetchScienceData()
    }

//    func fetchData() {
//        guard let dbRef = try? Realm() else { return }
//        let results = dbRef.objects(Curriculum03.self)
//        self.curriculums = results.compactMap({ (curriculum) -> Curriculum03? in return curriculum })
//    }

    func fetchKorData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(Curriculum03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '국어'")
        self.koreans = results.compactMap({ (korean) -> Curriculum03? in return korean })
    }

    func fetchMathData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(Curriculum03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '수학'")
        self.maths = results.compactMap({ (math) -> Curriculum03? in return math })
    }

    func fetchSocietyData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(Curriculum03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '사회'")
        self.societys = results.compactMap({ (society) -> Curriculum03? in return society })
    }

    func fetchScienceData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(Curriculum03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '과학'")
        self.sciences = results.compactMap({ (science) -> Curriculum03? in return science })
    }


    
    func deleteData() {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            dbRef.deleteAll()
            fetchKorData()
            fetchMathData()
            fetchSocietyData()
            fetchScienceData()
        }
    }
      
}


