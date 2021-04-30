//
//  ANP03.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
//
import SwiftUI
import RealmSwift

class ANP03: Object,Identifiable, Codable{
    @objc dynamic var uuid: String = UUID().uuidString
    @objc dynamic var grade = ""
    @objc dynamic var semester = ""
    @objc dynamic var subject = ""
    @objc dynamic var chapter = 0
    @objc dynamic var chapName = ""
    @objc dynamic var page = 0
    @objc dynamic var time = ""
    @objc dynamic var actName = ""
    @objc dynamic var needs = ""
    @objc dynamic var activity = ""
    @objc dynamic var tip = ""
    @objc dynamic var picture = ""
    @objc dynamic var range = ""
}
