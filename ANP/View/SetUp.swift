//
//  SetUp.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/25.
//

import SwiftUI

struct SetUp: View {
    
    @State private var selectedGrade = "3학년"
    
    //퍼센트 단위를 배열로 만들어주고
    let grades = ["3학년", "4학년", "5학년", "6학년"]
    
    // UserDefaults 테스트
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State var selectedGrade1 = ""
    
    let buttonLabel_31 = "3학년 1학기"
    let buttonLabel_32 = "3학년 2학기"
    
    var body: some View {

        NavigationView {
            Form {
               //퍼센트 섹션
                Section {
                    Picker("학년 선택", selection: $selectedGrade) {
//                        ForEach(0 ..< grades.count) {
//                            Text("\(self.grades[$0])")
//                        }
                        ForEach(grades, id: \.self) {
                            Text($0)
                        }
                    }
//                    .onChange(of: "Value", perform: { value in
//                        print(selectedGrade)
//                    })
                    Text(selectedGrade)
                }
                
                Section {
                    // UserDefaults 테스트
                    Button("Tap count: \(tapCount)") {
//                        self.tapCount += 1
//                        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                        UserDefaults.standard.set(self.buttonLabel_31, forKey: "Grade")
                        selectedGrade1 = UserDefaults.standard.string(forKey: "Grade") ?? ""
                    }
                    
                    Button("Tap count: \(tapCount)") {
//                        self.tapCount += 1
//                        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                        UserDefaults.standard.set(self.buttonLabel_32, forKey: "Grade")
                        selectedGrade1 = UserDefaults.standard.string(forKey: "Grade") ?? ""
                    }
                    
//                    Text("Tap count1: \(selectedGrade1 ?? "")")
                    Text("Tap count2: \(selectedGrade1)")
                }
                
            }
            
            
//            List {
//
//
//
//                // UserDefaults 테스트
//                Button("Tap count: \(tapCount)") {
//                    self.tapCount += 1
//                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//                }
//
//              Text("aaa")
//            } // List
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
            .navigationBarItems(trailing: Button(action: { print("1111") }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
            })
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
    }
}





