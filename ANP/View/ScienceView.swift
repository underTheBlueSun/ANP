//
//  ScienceView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct ScienceView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(curriculumViewModel.sciences) { science in
                HStack {
                    Text(science.grade)
                    Text(science.semester)
                    Text(science.subject)
                    Text(science.chapter)
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

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
            .environmentObject(CurriculumViewModel())
    }
}

