//
//  AddActView.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
//
import SwiftUI

struct AddActView: View {
    
    @EnvironmentObject var anpViewModel: ANPViewModel
    @Environment(\.presentationMode) var presentation
    
    var subject: String
    var chapter: Int
    var chapName: String
    
    
    // 놀이를 입력해야 완료 버튼이 활성화 되게
    @State private var isActivity = false
    
    init(subject: String, chapter: Int, chapName: String) {
        self.subject = subject
        self.chapter = chapter
        self.chapName = chapName
        
        // picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.eliBlue)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
//                        Image(systemName: "paintbrush.pointed.fill").foregroundColor(.yellow).font(.system(size: 15))
//                        TextField("준비물", text: $anpViewModel.needs).font(.system(size: 13)).foregroundColor(.gray)
                        
                        Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 30)).opacity(0.8)
                        TextField("제목", text: $anpViewModel.actName, onEditingChanged: { editing in self.isActivity = true}).font(.system(size: 18)).frame(width: 200)
//                        Spacer()
//                        TextField("차시", text: $anpViewModel.time).foregroundColor(.gray).font(.system(size: 13)).keyboardType(.phonePad)
                    }
                    
                }
                
                Section() {
                    VStack {
                        HStack {
//                            TextField("차시", text: $anpViewModel.time).foregroundColor(.gray).font(.system(size: 13)).keyboardType(.phonePad)
//                            Spacer()
                            Image(systemName: "paintbrush.pointed.fill").foregroundColor(.yellow).font(.system(size: 15))
                            TextField("준비물", text: $anpViewModel.needs).font(.system(size: 13)).foregroundColor(.gray)
//                            Spacer()
//
//                            Picker("범위", selection: $anpViewModel.range) {
//                                ForEach(range, id: \.self) {
//                                    Text($0)
//                                }
//                            } // picker
//                            .pickerStyle(SegmentedPickerStyle())
//                            .frame(width: 100)
//                            .scaledToFit()
//                            .scaleEffect(CGSize(width: 0.9, height: 0.8))
                        } // hstack
                        
                        // 활동내용
                        TextEditor(text: $anpViewModel.activity).frame(height: 280)
                        
                    } // vstack
                } // section
                
                Section() {
                    HStack(alignment: .top) {
                        // 팁
                        Text("Tip").foregroundColor(.yellow).font(.system(size: 13))
                        TextEditor(text: $anpViewModel.tip).frame(height: 50).font(.system(size: 13)).padding(.vertical, 5)
                    }
                    
                } // section
                
            } // form
            .navigationBarTitle(String(self.chapter)+". "+self.chapName, displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
//                            studentViewModelData.updateObject = nil
                            presentation.wrappedValue.dismiss()

                    }, label: {
                        Text("취소")
                    })
                } // ToolbarItem
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isActivity == true {
                        Button(action: {
                            anpViewModel.addData(presentation: presentation)

                        }, label: {
                            Text("완료")
                        })
                    }
                    
                } // ToolbarItem
            } // toolbar
        } // navigationView
        .onAppear() {
            anpViewModel.subject = self.subject
            anpViewModel.chapter = self.chapter
            anpViewModel.chapName = self.chapName
//            anpViewModel.fetchData()
            anpViewModel.reset()
//            print("chapter1=", chapter)
        }

    }
}

struct AddActView_Previews: PreviewProvider {
    static var previews: some View {
        AddActView(subject: "국어", chapter: 1, chapName: "재미가 톡톡")
            .environmentObject(ANPViewModel())
    }
}
