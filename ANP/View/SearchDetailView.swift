//
//  SearchDetailView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/30.
//

import SwiftUI

struct SearchDetailView: View {
    
//    @EnvironmentObject var anpViewModel: ANPViewModel
    
    @State var openNewPage = false
    // sheet를 멀티로 띄우기 위해
    @State var activeSheet: ActiveSheet?
    
    var anp: ANP03
    
    init(anp: ANP03) {
        self.anp = anp
    }
    
    var body: some View {
       
        Form {
            HStack {
                // 공통인지 일부 공통인지등에 따라 아이콘 색깔 다르게
                if anp.range == "all" {
                    Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 25)).opacity(0.8)
                }else {
                    Image(systemName: "square.grid.2x2.fill").foregroundColor(.pink).font(.system(size: 25)).opacity(0.8)
                }
                Text(anp.actName).font(.system(size: 20))
                Spacer()
                Text(anp.time).foregroundColor(.gray).font(.system(size: 13))
            }
                
            Section() {
                VStack {
                    HStack {
//                        Image(systemName: "paintbrush.pointed.fill").foregroundColor(.yellow).font(.system(size: 15))
//                        Text(anp.needs).font(.system(size: 13)).foregroundColor(.gray)
                        Text("준비물: " + anp.needs)
                            .font(.system(size: 12))
                            .foregroundColor(.white).padding(.vertical, 2).padding(.horizontal,2)
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color.yellow).shadow(radius: 0))
                        Spacer()
                    } // hstack
                    
                    // 놀이내용
//                    TextEditor(text: $activity).frame(height: 300)
                    Text(anp.activity)
                    Divider()
                    HStack {
                        if anp.picture != "없음" {
                            Image(anp.picture)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 110)
                                .cornerRadius(7) // Inner corner radius
                                .padding(.vertical, 5)
                        }
//                        Spacer()
                    }
                    
                    
                } // vstack
            } // section
            
            Section() {
                HStack(alignment: .top) {
                    // 팁
//                    Text("Tip").foregroundColor(.yellow).font(.system(size: 14))
//                    Text("팁")
//                        .font(.system(size: 12))
//                        .foregroundColor(.white).padding(.vertical, 2).padding(.horizontal,2)
//                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.yellow).shadow(radius: 0))
                    Image(systemName: "wand.and.stars.inverse").foregroundColor(.yellow)
                    Text(anp.tip).font(.system(size: 13)).padding(.vertical, 5)
                    
                    
//                    TextEditor(text: $tip).font(.system(size: 13)).padding(.vertical, 5)
                }
                
            } // section
            
        } // form
//        .navigationBarTitle(String(chapter)+"단원", displayMode: .inline)
        .fullScreenCover(item: $activeSheet) { item in
                switch item {
                case .first:
                    AddActView(subject: anp.subject, chapter: anp.chapter, chapName: anp.chapName)
                case .second:
                    SearchActView()
                }
        }
//        .onAppear(perform: {
//            print("detail onappear")
//            anpViewModel.listCheck = true
//        })
        
    }
}
