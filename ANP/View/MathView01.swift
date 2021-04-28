//
//  MathView01.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct MathView01: View {

    @EnvironmentObject var MathView01Model: MathView01Model
    
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    MathView01Model.deleteData()
                }, label: {
                     Text("컬리삭제").font(.title2)
                })
                ForEach(MathView01Model.curriculums) { curriculum in
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

struct MathView01_Previews: PreviewProvider {
    static var previews: some View {
        MathView01()
            .environmentObject(MathView01Model())
    }
}

