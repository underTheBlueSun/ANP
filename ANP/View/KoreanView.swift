//
//  KoreanView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ........
import SwiftUI

struct KoreanView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    @State var openNewPage = false
    
    var body: some View {
        
    
        NavigationView {

//            Button(action: {
//                curriculumViewModel.deleteData()
//            }, label: {
//                 Text("완전삭제")
//            })

                List {

                    ForEach(curriculumViewModel.koreans) { korean in

                        Section {
                            HStack {
                                Image(systemName: String(korean.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
                                NavigationLink(destination: ActivityView(subject: korean.subject, chapter: korean.chapter, chapName: korean.chapName)) {
                                    Text(korean.chapName).font(.system(size: 17))
                                }
                            }
                            .padding(.vertical, 5)

                        } // section

                  } // ForEach
                } // form
                .listStyle(InsetGroupedListStyle())


//            } // vstack

            .fullScreenCover(isPresented: $openNewPage) {
                SearchActView()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image(systemName: "book.fill").foregroundColor(.white).font(.system(size: 20))
                        Text("국어").font(.system(size: 20)).foregroundColor(.white)
                    }
                } // ToolbarItem
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        openNewPage.toggle()
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
