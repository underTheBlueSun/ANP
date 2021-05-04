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
    
    func addData(presentation: Binding<PresentationMode>) {
        let anp = ANP03()
//        anp.uuid = UUID().uuidString // ANP03()에서 이미 생성하니 따로 생성할 필요없다
        anp.grade = self.grade
        anp.semester = self.semester
        anp.subject = self.subject
        anp.chapter = self.chapter
        anp.chapName = self.chapName
        anp.page = self.page
        anp.time = self.time.trimmingCharacters(in: .whitespaces)
        anp.actName = self.actName
        anp.needs = self.needs
        anp.activity = self.activity
        anp.tip = self.tip
        anp.picture = self.picture
        anp.range = self.range
        
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            dbRef.add(anp)
        } // try? dbRef.write

        fetchData()

        presentation.wrappedValue.dismiss()

    } // addData
      
}
