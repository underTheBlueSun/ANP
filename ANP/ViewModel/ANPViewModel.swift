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
    @Published var time = "1차시"
    @Published var actName = ""
    @Published var needs = ""
    @Published var activity = ""
    @Published var tip = "없음"
    @Published var picture = "없음"
    @Published var range = "없음"
    @Published var anps: [ANP03] = []
    
    var rangeFilter = ""
    var grade_result = ""
    var semester_result = ""

    func fetchData() {
        
        // 4학년-1학기-3 -> 4-1-3
        let grade_endIdx: String.Index = grade.index(grade.startIndex, offsetBy: 0)
        grade_result = String(grade[...grade_endIdx])
        let semester_endIdx: String.Index = semester.index(grade.startIndex, offsetBy: 0)
        semester_result = String(semester[...semester_endIdx])
        range = grade_result + "-" + semester_result + "-" + String(chapter)
        
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(ANP03.self).filter("grade == '\(grade)' and semester == '\(semester)' and subject == '\(subject)' and chapter == \(chapter) or (subject == '\(subject)' and range contains '\(range)' ) or (subject == '\(subject)' and range contains 'all' )" ).sorted(byKeyPath: "actName", ascending: true).sorted(byKeyPath: "time", ascending: true)
        self.anps = results.compactMap({ (anp) -> ANP03? in return anp })

    }
    
    func addData(presentation: Binding<PresentationMode>) {
        let anp = ANP03()
//        anp.uuid = UUID().uuidString // ANP03()에서 이미 생성하니 따로 생성할 필요없다
        
        anp.grade = self.grade
        anp.semester = self.semester
        anp.subject = self.subject
        anp.chapter = self.chapter
        anp.chapName = self.chapName
        anp.page = self.page
        if self.time == "" {
            anp.time = "1차시"
        }else{
            anp.time = self.time.trimmingCharacters(in: .whitespaces)
        }
        
        anp.actName = self.actName
        if self.needs == "" {
            anp.needs = "없음"
        }else{
            anp.needs = self.needs
        }
        
        anp.activity = self.activity
        if self.tip == "" {
            anp.tip = "없음"
        }else{
            anp.tip = self.tip
        }
        anp.picture = self.picture
        anp.range = self.range
        

        
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            dbRef.add(anp)
        } // try? dbRef.write

        fetchData()

        presentation.wrappedValue.dismiss()

    } // addData
    
    func reset() {
        actName = ""
        time = ""
        needs = ""
        activity = ""
        tip = ""
    }
    
    func deleteData(object: ANP03) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {

            dbRef.delete(object)
            fetchData()
        }
    }
    
      
}
