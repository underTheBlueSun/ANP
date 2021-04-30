//
//  ActivityView.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
//
import SwiftUI

struct ActivityView: View {
    
    @EnvironmentObject var anpViewModel: ANPViewModel
//    @EnvironmentObject var koreanViewModel: KoreanViewModel
//    @StateObject var koreanViewModel = KoreanViewModel()
    
    var subject: String
    var chapter: Int

    init(subject: String, chapter: Int) {
        self.subject = subject
        self.chapter = chapter
    }
    
    var body: some View {
//        NavigationView {
            Form {
                ForEach(anpViewModel.anps) { anp in
                    Section {
                        NavigationLink(destination: Text("aaa")) {
                            HStack {
                                Image(systemName: String(anp.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
//                                Text(korean.chapter).font(.system(size: 17)).foregroundColor(.systemTeal)
                                Text(anp.time).font(.system(size: 17))
                                Spacer()
                                Text(String(anp.actName)).foregroundColor(.gray).font(.system(size: 13))
                            }
                            .padding(.vertical, 5)
                        }
                    } // section
                } // ForEach
            } // form
//            .background(Color.white)
//            .navigationBarTitle(anpViewModel.grade + " " + anpViewModel.semester, displayMode: .inline)
//            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
//                        검색 기능 구현하기
                    }, label: {
                         Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.white)
                    })
                } // ToolbarItem
            } // toolbar
//        } // NavigationView
//        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            anpViewModel.subject = self.subject
            anpViewModel.chapter = self.chapter
            anpViewModel.fetchData()
//            print("chapter1=", chapter)
        }

    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(subject: "국어", chapter: 1)
            .environmentObject(ANPViewModel())
    }
}
