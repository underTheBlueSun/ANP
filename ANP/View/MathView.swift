//
//  MathView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct MathView: View {
    
    @State private var selectedGubun = "짝"
    @State private var junbi = "필기구, A4종이"
    @State private var activity = "1. ㅇㅇㅇㅇ \n2. dfdsfdsf\n3. fdsfdsfdsf\n4. dfdfdsds\n2. dfdsfdsf\n3. fdsfdsfdsf\n4. dfdfdsds"
    @State private var tip = "오늘은 즐거운 토요일이야~~~~동해물과 백두산이 마르고 닳도록 하나님!\nsdfs111dfsdafsdfsdafsda"
    
    let gubun = ["짝", "모둠", "전체"]
    
    init() {
        // picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.eliBlue)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        Form {
            Section() {
                HStack {
                    Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 30)).opacity(0.8)
                    Text("재미가 톡톡").font(.system(size: 20))
                    Spacer()
                    Text("3~4차시").foregroundColor(.gray).font(.system(size: 13))
                }
                
            }
            
            
            Section() {
                VStack {
                    HStack {
                        Image(systemName: "paintbrush.pointed.fill").foregroundColor(.yellow).font(.system(size: 15))
//                        Text("필기구, A4종이").font(.system(size: 13)).foregroundColor(.gray)
                        TextField("준비물", text: $junbi).font(.system(size: 13)).foregroundColor(.gray)
                        Spacer()
                        Picker("tip Perentage", selection: $selectedGubun) {
                            ForEach(gubun, id: \.self) {
                                Text($0)
                            }
                        } // picker
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                        .scaledToFit()
                        .scaleEffect(CGSize(width: 0.9, height: 0.8))
                    } // hstack
                    
                    // 놀이내용
                    TextEditor(text: $activity).frame(height: 200)
                    Divider()
                    HStack {
                        Image("apple")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 110)
                            .cornerRadius(7) // Inner corner radius
                            .padding(.vertical, 5)
                        Spacer()
                    }
                    
                    
                } // vstack
            } // section
            
            Section() {
                HStack(alignment: .top) {
                    // 팁
                    Text("Tip").foregroundColor(.yellow).font(.system(size: 13))
                    TextEditor(text: $tip).font(.system(size: 13)).padding(.vertical, 5)
                }
                
            } // section
            
        } // form
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView()
    }
}

