//
//  Curriculum02.swift
//  ANP
//
//  Created by macbook on 2021/04/29.
//

import SwiftUI
import RealmSwift

class Curriculum02: Object,Identifiable, Codable{
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var grade = ""
    @objc dynamic var semester = ""
    @objc dynamic var subject = ""
    @objc dynamic var chapter = ""
    @objc dynamic var chapName = ""
    @objc dynamic var page = 0
}
