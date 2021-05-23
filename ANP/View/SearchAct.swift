//
//  SearchAct.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
//
import SwiftUI

struct SearchAct: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            Form {
                Text("검색")
                Section() {
                    HStack {
                        Text("aaaa")
                    }
                    
                }
                
                Section() {
                    VStack {
                       Text("bbbb")
                        
                    } // vstack
                } // section
                
            } // form
            .navigationBarTitle("검색", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
//                            studentViewModelData.updateObject = nil
                            presentation.wrappedValue.dismiss()

                    }, label: {
                        Text("취소")
                    })
                } // ToolbarItem
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        anpViewModel.addData(presentation: presentation)
//
//                    }, label: {
//                        Text("완료")
//                    })
//                } // ToolbarItem
            } // toolbar
        } // navigationView

    }
}

struct SearchAct_Previews: PreviewProvider {
    static var previews: some View {
        SearchAct()
            .environmentObject(ANPViewModel())
    }
}
