//
//  ANPJsonUpload.swift
//  ANP
//
//  Created by macbook on 2021/04/27.
//

import Foundation
import SwiftUI
import RealmSwift

final class JsonUpload: ObservableObject {
  
  @Published var curriculums: [Curriculum02]
  @State private var isUploaded = UserDefaults.standard.bool(forKey: "Upload")

  init(filename: String = "CurriculumData.json") {
    self.curriculums = Bundle.main.decode(filename: filename, as: [Curriculum02].self)
    // 업로드는 한번만 되게
//    addData()
    if isUploaded == false {
        addData()
    }
  }
    
    func addData() {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write {
            for curriculum in curriculums {
                dbRef.add(curriculum)
            }
            // curriculum json 모두 업로드한 후 userdefaults에 저장
            UserDefaults.standard.set(true, forKey: "Upload")
        } // try? dbRef.write

    }
}
