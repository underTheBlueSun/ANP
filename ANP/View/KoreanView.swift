//
//  KoreanView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ......
import SwiftUI

struct KoreanView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    
    var body: some View {
        NavigationView {
            
            Form {
                Image(systemName: "tray.and.arrow.down.fill")
                
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
                    
                    
                        Section {
                            NavigationLink(destination: ActivityView(subject: korean.subject, chapter: korean.chapter)) {
                                HStack {
                                    Image(systemName: String(korean.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
    //                                Text(korean.chapter).font(.system(size: 17)).foregroundColor(.systemTeal)
                                    Text(korean.chapName).font(.system(size: 17))
                                    Spacer()
                                    Text(String(korean.page)).foregroundColor(.gray).font(.system(size: 13))
                                }
                                .padding(.vertical, 5)
                            }
                            
                        } // section
                        
                        
//                    }
              } // ForEach
            } // form
            .background(Color.white)
            .navigationBarTitle(curriculumViewModel.grade + " " + curriculumViewModel.semester + "  국어", displayMode: .inline)
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
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
