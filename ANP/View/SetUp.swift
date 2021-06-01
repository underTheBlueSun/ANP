//
//  SetUp.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/25.
// ....
import SwiftUI

struct SetUp: View {
    @EnvironmentObject var curriculumViewModel: CurriculumViewModel
//    @EnvironmentObject var koreanViewModel: KoreanViewModel
    @EnvironmentObject var anpViewModel: ANPViewModel
    
    @State private var selectedGrade = UserDefaults.standard.string(forKey: "Grade") ?? ""
    @State private var selectedSemester = UserDefaults.standard.string(forKey: "Semester") ?? ""
//    @State private var selectedGrade = "4학년"
//    @State private var selectedSemester = "1학기"
    let grades = ["3학년", "4학년", "5학년", "6학년"]
    let semesters = ["1학기", "2학기"]
    
    // UserDefaults
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State var openNewPage = false
    
    var body: some View {

        NavigationView {
            Form {
//                Section {
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
//                } // section
                
                Section {
                    NavigationLink(destination: SetUPDetail(gubun: "사용자 설명서")) {
                        Text("사용자 설명서")
                    }
                }
                
                Section {
                    NavigationLink(destination: SetUPDetail(gubun: "개발자 정보")) {
                        Text("개발자 정보")
                    }
                    
                }
                
                Section {
                    NavigationLink(destination: SetUPDetail(gubun: "참고 문헌")) {
                        Text("참고 문헌")
                    }
                    
                }
                Section {
                    NavigationLink(destination: SetUPDetail(gubun: "개인정보 정책")) {
                        Text("개인정보 정책")
                    }
                    
                }
                
            } // form
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image(systemName: "gearshape.fill").foregroundColor(.white).font(.system(size: 20))
                        Text("설정").font(.system(size: 20)).foregroundColor(.white)
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
            .navigationBarColor(backgroundColor: UIColor(Color.eliBlue), tintColor: .white)
        } // NavigationView
        .fullScreenCover(isPresented: $openNewPage) {
            SearchActView()
        }
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

//            koreanViewModel.grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
//            koreanViewModel.semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
            
            anpViewModel.grade = UserDefaults.standard.string(forKey: "Grade") ?? ""
            anpViewModel.semester = UserDefaults.standard.string(forKey: "Semester") ?? ""
            
        })

    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
            .environmentObject(CurriculumViewModel())
    }
}
