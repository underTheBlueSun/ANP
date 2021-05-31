//
//  ActivityView.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
// ....
import SwiftUI
import RealmSwift

struct ActivityView: View {
    
    @EnvironmentObject var anpViewModel: ANPViewModel
//    @EnvironmentObject var koreanViewModel: KoreanViewModel
//    @StateObject var anpViewModel = ANPViewModel()
    
//    @Environment(\.presentationMode) var presentation
    
    var subject: String
    var chapter: Int
    var chapName: String
    
    
//    @State var openNewPage = false
    
    // sheet를 멀티로 띄우기 위해
    @State var activeSheet: ActiveSheet?
    
    @State var anp: ANP03?

    init(subject: String, chapter: Int, chapName: String) {
        self.subject = subject
        self.chapter = chapter
        self.chapName = chapName
    }
    
    
        
    var body: some View {
        Form {
            HStack {
                Text(String(self.chapter) + "단원")
                    .foregroundColor(.white).padding(.vertical, 2).padding(.horizontal,2)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.yellow).shadow(radius: 0))
                Text(self.chapName)
            }
            
            ForEach(anpViewModel.anps) { anp in

                Section() {
                    
                    ZStack {
                        VStack {
                            
                            HStack {
                                
                                // 공통인지 일부 공통인지등에 따라 아이콘 색깔 다르게
                                if anp.range == "all" {
                                    Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 25)).opacity(0.8)
                                }else {
                                    Image(systemName: "square.grid.2x2.fill").foregroundColor(.pink).font(.system(size: 25)).opacity(0.8)
                                }
                                
                                Text(anp.actName).font(.system(size: 18))
                                Spacer()
//                                Text(String(anp.time)).foregroundColor(.gray).font(.system(size: 13))
//                                Spacer()
                                Button(action: {  }) {
                                    Image(systemName: "trash").foregroundColor(.gray).opacity(0.3).font(.system(size: 11))
                                }
                                .onLongPressGesture(minimumDuration: 1) { anpViewModel.deleteData(object: anp) }
                            }
                            HStack {
                                Text(String(anp.activity.replacingOccurrences(of: "\n\n", with: ""))).foregroundColor(.gray).frame(width: 300, height: 50, alignment: .leading).font(.system(size: 13)).padding(.horizontal, 3)
                                Spacer()
                            }
                            NavigationLink(destination: DetailActView(anp: anp)) {
                                EmptyView()
                            }
                            .frame(width: 0, height: 0)
                            .hidden()
                            
                        } // VStack
                        
                    }
                    
                    
                } // section

            } // ForEach

        } // form
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
//                    Image(systemName: "book.fill").foregroundColor(.white).font(.system(size: 20))
                    Text(self.subject).font(.system(size: 20)).foregroundColor(.white)
                }
            } // ToolbarItem
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack() {
                    Button(action: {
    //                        self.openNewPage.toggle()
                        activeSheet = .first
                    }, label: {
                         Image(systemName: "plus.circle.fill").font(.title2).foregroundColor(.white)
                    })
                    .padding()
                    Button(action: {
                        activeSheet = .second
                    }, label: {
                         Image(systemName: "magnifyingglass").font(.title2).foregroundColor(.white)
                    })
                }
                
            } // ToolbarItem
        } // toolbar
//        .navigationViewStyle(StackNavigationViewStyle())
//        .fullScreenCover(isPresented: $openNewPage) {
//            AddActView(subject: self.subject, chapter: self.chapter, chapName: self.chapName)
//        }
        .fullScreenCover(item: $activeSheet) { item in
                switch item {
                case .first:
                    AddActView(subject: self.subject, chapter: self.chapter, chapName: self.chapName)
                case .second:
                    SearchActView()
                }
        }
        .onAppear() {
            //if 안쓰고 그냥 fetch 하면 detail 에서 back(이전)하면 리스트 처음 row부터 reset 됨
            if anpViewModel.subject == self.subject && anpViewModel.chapter == self.chapter {
                return
            }else {
                anpViewModel.subject = self.subject
                anpViewModel.chapter = self.chapter
                anpViewModel.fetchData()
            }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(subject: "국어", chapter: 1, chapName: "재미가 톡톡")
            .environmentObject(ANPViewModel())
    }
}


