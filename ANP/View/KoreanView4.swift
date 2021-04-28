//
//  KoreanView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct KoreanView4: View {

    @EnvironmentObject var koreanViewModel: KoreanViewModel
    @EnvironmentObject private var aNPJsonUpload: ANPJsonUpload
    @State var selectedGrade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    
    let grades = ["3학년 1학기", "3학년 2학기", "4학년 1학기", "4학년 2학기", "5학년 1학기", "5학년 2학기", "6학년 1학기", "6학년 2학기"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(aNPJsonUpload.anps) { anp in
                HStack {
//                    TextField("주소", text: $koreanViewModel.test1).frame(width: 100)
                    Text(anp.activityName)
                    Text(anp.chapter)
//                    Image(anp.needs)
//                        .resizable()
//                        .frame(width: 150, height: 100)
//                        .cornerRadius(15)
                }
//                    HStack {
//                      ProductRow(product: product, quickOrder: self.$quickOrder)
//                      NavigationLink(destination: ProductDetailView(product: product)) {
//                        EmptyView()
//                      }.frame(width: 0).hidden()
//                    }
              } // ForEach
            } // List
            .background(Color.white)
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        
                        ForEach(grades, id: \.self) { grade in
//                                            Text($0)
                            Button(action: {
                                UserDefaults.standard.set(grade, forKey: "Grade")
                                selectedGrade = UserDefaults.standard.string(forKey: "Grade") ?? ""
                            }) {
                                Label(grade, systemImage: "circle.grid.cross.left.fill")
                            }
                        }
                        
                    } // Menu
                    label: {
                        Text(selectedGrade).foregroundColor(.white).font(.system(size: 15))
                        Image(systemName: "gearshape.fill").font(.title2).foregroundColor(.white)
                    }
                } // ToolbarItem
            } // toolbar
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct KoreanView4_Previews: PreviewProvider {
    static var previews: some View {
        KoreanView4()
            .environmentObject(KoreanViewModel())
            .environmentObject(ANPJsonUpload())
    }
}

