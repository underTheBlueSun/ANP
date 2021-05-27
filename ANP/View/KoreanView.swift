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
            VStack {
                HStack {
                    Spacer()
                    Image("koreanTitleImage")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
//                        .cornerRadius(7) // Inner corner radius
                }
                
                List {
                    
                    

                    ForEach(curriculumViewModel.koreans) { korean in
                        
                        Section {
                            HStack {
                                Image(systemName: String(korean.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
                                Text(korean.chapName).font(.system(size: 17))
                                Spacer()
                                Text(String(korean.page)).foregroundColor(.gray).font(.system(size: 13))
                                NavigationLink(destination: ActivityView(subject: korean.subject, chapter: korean.chapter, chapName: korean.chapName)) {
                                    EmptyView()
                                }
                                .frame(width: 0, height: 0)
                                .hidden()
                            }
                            .padding(.vertical, 5)

                        } // section
                            
                  } // ForEach
                } // form
                .listStyle(InsetGroupedListStyle())

                
            } // vstack

            .fullScreenCover(isPresented: $openNewPage) {
                SearchAct()
            }
            .navigationBarTitle("다음수업뭐하지", displayMode: .inline)
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
            .toolbar {
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
