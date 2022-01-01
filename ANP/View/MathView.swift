//
//  MathView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ........
import SwiftUI

struct MathView: View {

    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    @State var openNewPage = false
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(curriculumViewModel.maths) { math in
                        
                        Section {
                            HStack {
                                Image(systemName: String(math.chapter) + ".circle.fill").foregroundColor(.yellow).font(.system(size: 25))
//                                Text(math.chapName).font(.system(size: 17))
//                                Spacer()
//                                Text(String(math.page)).foregroundColor(.gray).font(.system(size: 13))
                                NavigationLink(destination: ActivityView(subject: math.subject, chapter: math.chapter, chapName: math.chapName)) {
                                    Text(math.chapName).font(.system(size: 17))
                                }
//                                .frame(width: 0, height: 0)
//                                .hidden()
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
                        Image(systemName: "chart.bar.xaxis").foregroundColor(.white).font(.system(size: 20))
                        Text("수학").font(.system(size: 20)).foregroundColor(.white)
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

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView()
            .environmentObject(CurriculumViewModel())
    }
}
