//
//  ActivityView.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
// ....
import SwiftUI

struct ActivityView: View {
    
    @EnvironmentObject var anpViewModel: ANPViewModel
//    @EnvironmentObject var koreanViewModel: KoreanViewModel
//    @StateObject var koreanViewModel = KoreanViewModel()
    
    var subject: String
    var chapter: Int
    var chapName: String
    
    @State var openNewPage = false

    init(subject: String, chapter: Int, chapName: String) {
        self.subject = subject
        self.chapter = chapter
        self.chapName = chapName
    }
    
    var body: some View {
//        NavigationView {
            Form {
                HStack {
//                    Image(systemName: String(self.chapter) + ".circle.fill").foregroundColor(.yellow
                    Text(String(self.chapter) + "단원")
                        .foregroundColor(.white).padding(.vertical, 2).padding(.horizontal,2)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.yellow).shadow(radius: 0))
                    Text(self.chapName)
                }
                
                ForEach(anpViewModel.anps) { anp in
                    Section() {
                        VStack {
                            HStack {
                                Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 30)).opacity(0.8)
                                Text(anp.actName).font(.system(size: 22))
                                Spacer()
                                Text(String(anp.time)).foregroundColor(.gray).font(.system(size: 13))
                            }
                            HStack {
                                Text(String(anp.activity)).foregroundColor(.gray).frame(width: 300, height: 80, alignment: .leading).font(.system(size: 13)).padding(.horizontal, 3)
                                Spacer()
                            }
                            
                        }
                    } // section
                } // ForEach
            } // form
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.openNewPage.toggle()
                    }, label: {
                         Image(systemName: "plus.circle.fill").font(.title2).foregroundColor(.white)
                    })
//                    Button(action: {
////                        검색 기능 구현하기
//                    }, label: {
//                         Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.white)
//                    })
                } // ToolbarItem
            } // toolbar
//        } // NavigationView
//        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $openNewPage) {
            AddActView(subject: self.subject, chapter: self.chapter, chapName: self.chapName)
//                .environmentObject(studentViewModelData)
//                .environmentObject(homeViewModelData)
        }
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
        ActivityView(subject: "국어", chapter: 1, chapName: "재미가 톡톡")
            .environmentObject(ANPViewModel())
    }
}
