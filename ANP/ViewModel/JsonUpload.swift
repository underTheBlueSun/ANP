//
//  ANPJsonUpload.swift
//  ANP
//
//  Created by macbook on 2021/04/27.
// ..
import Foundation
import SwiftUI
import RealmSwift

final class JsonUpload: ObservableObject {
  
  @Published var curriculums: [Curriculum03]
  @Published var anps: [ANP03]
    
  @State private var isUploaded = UserDefaults.standard.bool(forKey: "Upload")

//  init(filename: String = "CurriculumData.json") {
    init() {
        self.curriculums = Bundle.main.decode(filename: "CurriculumData.json", as: [Curriculum03].self)
        self.anps = Bundle.main.decode(filename: "ANPData.json", as: [ANP03].self)
        // 업로드는 한번만 되게...
//        addCurriData()
//        addANPData()
        if isUploaded == false {
            addCurriData()
            addANPData()
        }
  }
    
    func addCurriData() {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            for curriculum in curriculums {
                dbRef.add(curriculum)
            }
            // curriculum json 모두 업로드한 후 userdefaults에 저장
//            UserDefaults.standard.set(true, forKey: "Upload")
        } // try? dbRef.write
    }
    
    func addANPData() {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            for anp in anps {
                dbRef.add(anp)
            }
            // curriculum json 모두 업로드한 후 userdefaults에 저장
            UserDefaults.standard.set(true, forKey: "Upload")
        } // try? dbRef.write
    }
}
