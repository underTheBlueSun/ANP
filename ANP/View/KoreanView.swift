//
//  KoreanView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ..

import SwiftUI

struct KoreanView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Button(action: {
                    curriculumViewModel.deleteData()
                }, label: {
                     Text("컬리삭제").font(.title2)
                })
                ForEach(curriculumViewModel.koreans) { korean in
//                HStack {
//                    Text(korean.grade)
//                    Text(korean.semester)
//                    Text(korean.subject)
//                    Text(korean.chapter)
//                }
//                    GroupBox(
//                        label: Label(korean.chapter, systemImage: "heart.fill")
//                                    .foregroundColor(.red)
//                            ) { Text(korean.chapName) }.padding(.vertical,3).padding(.horizontal,20)
                    
//                    Form {
                        Section {
                            HStack {
                                Image(systemName: String(korean.chapter) + ".circle.fill").foregroundColor(.systemTeal).font(.system(size: 30))
//                                Text(korean.chapter).font(.system(size: 17)).foregroundColor(.systemTeal)
                                Text(korean.chapName).font(.system(size: 17))
                            }
                            .padding(.vertical, 5)
                        }
                        
//                    }
                    
              } // ForEach
            } // form
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

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanView()
            .environmentObject(CurriculumViewModel())
    }
}

