//
//  Curriculum03.swift
//  ANP
//
//  Created by macbook on 2021/04/29.
//

import SwiftUI
import RealmSwift

class Curriculum03: Object,Identifiable, Codable{
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var grade = ""
//    @objc dynamic var grade: String?
    @objc dynamic var semester = ""
    @objc dynamic var subject = ""
    @objc dynamic var chapter = 0
    @objc dynamic var chapName = ""
    @objc dynamic var page = 0
}
