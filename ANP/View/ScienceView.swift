//
//  ScienceView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ........
import SwiftUI

struct ScienceView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    @State var openNewPage = false
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(curriculumViewModel.sciences) { science in
                        
                        Section {
                            HStack {
                                Image(systemName: String(science.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
                                Text(science.chapName).font(.system(size: 17))
                                Spacer()
                                Text(String(science.page)).foregroundColor(.gray).font(.system(size: 13))
                                NavigationLink(destination: ActivityView(subject: science.subject, chapter: science.chapter, chapName: science.chapName)) {
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

                
//            } // vstack

            .fullScreenCover(isPresented: $openNewPage) {
                SearchActView()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image(systemName: "gyroscope").foregroundColor(.white).font(.system(size: 20))
                        Text("과학").font(.system(size: 20)).foregroundColor(.white)
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

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
            .environmentObject(CurriculumViewModel())
    }
}
