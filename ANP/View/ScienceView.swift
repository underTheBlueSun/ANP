//
//  ScienceView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct ScienceView: View {

    @EnvironmentObject var koreanViewModel: KoreanViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(koreanViewModel.curriculums) { curriculum in
                HStack {
                    Text(curriculum.grade)
                    Text(curriculum.semester)
                    Text(curriculum.subject)
                    Text(curriculum.chapter)
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
            .environmentObject(KoreanViewModel())
    }
}

