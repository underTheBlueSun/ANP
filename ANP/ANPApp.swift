//
//  ANPApp.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..

import SwiftUI

@main
struct ANPApp: App {
    var body: some Scene {
        
        WindowGroup {
            MainTabView()
                .environmentObject(JsonUpload())
                .environmentObject(CurriculumViewModel())
                .environmentObject(KoreanViewModel())
//            SearchDefaultRealm()
        }
    }
}
