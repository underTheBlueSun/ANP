//
//  SocietyView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ........
import SwiftUI

struct SocietyView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    @State var openNewPage = false
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(curriculumViewModel.societys) { society in
                        
                        Section {
                            HStack {
                                Image(systemName: String(society.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
                                Text(society.chapName).font(.system(size: 17))
                                Spacer()
                                Text(String(society.page)).foregroundColor(.gray).font(.system(size: 13))
                                NavigationLink(destination: ActivityView(subject: society.subject, chapter: society.chapter, chapName: society.chapName)) {
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
                        Image(systemName: "person.2.fill").foregroundColor(.white).font(.system(size: 20))
                        Text("사회").font(.system(size: 20)).foregroundColor(.white)
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

struct SocietyView_Previews: PreviewProvider {
    static var previews: some View {
        SocietyView()
            .environmentObject(CurriculumViewModel())
    }
}
