//
//  MainTabView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct MainTabView: View {

    @StateObject var koreanViewModel = KoreanViewModel()

    
    init() {
        UITabBar.appearance().barTintColor = UIColor.tertiaryLabel
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    private enum Tabs {
      case korean, math, society, science, activity
    }

    @State private var selectedTab: Tabs = .korean
    
  var body: some View {
    
    TabView(selection: $selectedTab) {
        
      Group {
        korean
        math
        society
        science
        activity
      }
      
    }
    .accentColor(.systemTeal)
    .edgesIgnoringSafeArea(.top)
    .onAppear(perform: {
        // 앱이 활성화 되면 우리반 uuid를 변수에 저장
//        homeViewModelData.setUriBanID()
        // UriBanView에서 @StateObject var studentViewModelData: StudentViewModel = StudentViewModel()
        // 위처럼 하면 학반추가버튼 누르면 UriBanView의 onAppear 정상 작동 안함
        // students배열을 저장해 놓고 우리반,행발,과제,상담에서 탭 할때마다 fetchData 하는게 아니라
        // students 배열 미리 만들어 놓고 쓰기위해 (우리반 토글이 바뀌면 다시 students 배열 만듬)
//        studentViewModelData.uuid = homeViewModelData.uribanID
//        growthViewModelData.uuid = homeViewModelData.uribanID
//        subjectViewModelData.uuid = homeViewModelData.uribanID
//        counselViewModelData.uuid = homeViewModelData.uribanID
//        studentViewModelData.fetchData(uuid: homeViewModelData.uribanID)
    })
  }
}

private extension MainTabView {
    
    var korean: some View {
        KoreanView()
            .environmentObject(koreanViewModel)
            .tag(Tabs.korean)
            .tabItem {
              Image(systemName: "house.fill")
              Text("국어")
             }
    }
    
  var math: some View {
    
    Text("수학")
    //    UriBanView()
//        .environmentObject(homeViewModelData)
//        .environmentObject(studentViewModelData)
//        .environmentObject(growthViewModelData)
//        .environmentObject(subjectViewModelData)
//        .environmentObject(counselViewModelData)
        .tag(Tabs.math)
        .tabItem {
            Image(systemName: "person.2.fill")
            Text("수학")
        }
  }
    
    var society: some View {
        Text("사회")
//        GrowthView()
//            .environmentObject(homeViewModelData)
//            .environmentObject(studentViewModelData)
//            .environmentObject(growthViewModelData)
        .tag(Tabs.society)
          .tabItem {
              Image(systemName: "rectangle.stack.person.crop.fill")
              Text("사회")
          }
    }
  
  var science: some View {
    Text("과학")
//    SubjectView()
//        .environmentObject(homeViewModelData)
//        .environmentObject(studentViewModelData)
//        .environmentObject(subjectViewModelData)

      .tag(Tabs.science)
        .tabItem {
            Image(systemName: "note.text.badge.plus")
            Text("과학")
        }
  }
  
  var activity: some View {
    Text("창체")
//    CounselView()
//        .environmentObject(homeViewModelData)
//        .environmentObject(studentViewModelData)
//        .environmentObject(counselViewModelData)
      .tag(Tabs.activity)
        .tabItem {
            Image(systemName: "figure.stand.line.dotted.figure.stand")
            Text("창체")
        }
  }
    
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
