//
//  SocietyView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct SocietyView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(curriculumViewModel.societys) { society in
                HStack {
                    Text(society.grade)
                    Text(society.semester)
                    Text(society.subject)
                    Text(society.chapter)
                }
              } // ForEach
            } // List
            .background(Color.white)
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
//                        검색 기능 구현하기
                    }, label: {
                         Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.white)
                    })
                } // ToolbarItem
            } // toolbar
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct SocietyView_Previews: PreviewProvider {
    static var previews: some View {
        SocietyView()
            .environmentObject(CurriculumViewModel())
    }
}

