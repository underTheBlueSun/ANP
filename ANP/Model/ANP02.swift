//
//  ANP02.swift
//  ANP
//
//  Created by macbook on 2021/04/29.
//

import SwiftUI
import RealmSwift

class ANP02: Object,Identifiable, Codable{
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var grade = ""
    @objc dynamic var semester = ""
    @objc dynamic var subject = ""
    @objc dynamic var chapter = ""
    @objc dynamic var chapName = ""
    @objc dynamic var page = 0
    @objc dynamic var time = ""
    @objc dynamic var activityName = ""
    @objc dynamic var needs = ""
    @objc dynamic var activity = ""
    @objc dynamic var tip = ""
    @objc dynamic var picture = ""
    @objc dynamic var range = ""
}
