//
//  SetUp.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/25.
// ..

import SwiftUI

struct SetUp: View {
    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
    @State private var selectedGrade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @State private var selectedSemester = UserDefaults.standard.string(forKey: "Semester") ?? ""
//    @State private var selectedGrade = "4학년"
//    @State private var selectedSemester = "1학기"
    let grades = ["3학년", "4학년", "5학년", "6학년"]
    let semesters = ["1학기", "2학기"]
    
    // UserDefaults
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    let buttonLabel_31 = "3학년 1학기"
    let buttonLabel_32 = "3학년 2학기"
    
    var body: some View {

        NavigationView {
            Form {
                Section (header: Text("PROFILE")) {
                    Picker("학년 선택", selection: $selectedGrade) {
                        ForEach(grades, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("학기 선택", selection: $selectedSemester) {
                        ForEach(semesters, id: \.self) {
                            Text($0)
                        }
                    }
                } // section
                
                Section {
                    Text("사용자 설명서")
                }
                
                Section {
                    Text("자주 묻는 질문")
                }
                
                Section {
                    Text("1:1 문의")
                }
                Section {
                    Text("리뷰하기")
                }
                Section {
                    Text("개발자 정보")
                }
            } // form
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        UserDefaults.standard.set(self.selectedGrade, forKey: "Grade")
//                        UserDefaults.standard.set(self.selectedSemester, forKey: "Semester")
//                        koreanViewModel.grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
//                        koreanViewModel.semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
//                    }, label: { Text("저장").font(.title2).foregroundColor(.white) })
//                } // ToolbarItem
//            } // toolbar
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        // userdefaults에 학년학기 저장
        .onDisappear(perform: {
            UserDefaults.standard.set(self.selectedGrade, forKey: "Grade")
            UserDefaults.standard.set(self.selectedSemester, forKey: "Semester")
            curriculumViewModel.grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
            curriculumViewModel.semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
            curriculumViewModel.fetchKorData()
            curriculumViewModel.fetchMathData()
            curriculumViewModel.fetchSocietyData()
            curriculumViewModel.fetchScienceData()
            
        })

    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
            .environmentObject(CurriculumViewModel())
    }
}





