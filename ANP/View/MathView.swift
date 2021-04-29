//
//  MathView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..

import SwiftUI

struct MathView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    curriculumViewModel.deleteData()
                }, label: {
                     Text("컬리삭제").font(.title2)
                })
                ForEach(curriculumViewModel.maths) { math in
                HStack {
                    Text(math.grade)
                    Text(math.semester)
                    Text(math.subject)
//                    Text(math.chapter)
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

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView()
            .environmentObject(CurriculumViewModel())
    }
}

