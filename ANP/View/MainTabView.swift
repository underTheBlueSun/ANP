//
//  MainTabView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct MainTabView: View {

//    @EnvironmentObject var koreanViewModel: KoreanViewModel
//    @EnvironmentObject private var aNPJsonUpload: ANPJsonUpload
    
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
    })
  }
}

private extension MainTabView {
    
    var korean: some View {
        KoreanView()
            .onAppear(perform: {
                print("국어")
                
            })
//            .environmentObject(koreanViewModel)
//            .environmentObject(Store)
            .tag(Tabs.korean)
            .tabItem {
              Image(systemName: "house.fill")
              Text("국어")
             }
    }
    
  var math: some View {

//    Text("수학")
    KoreanView2()
        .onAppear(perform: { print("수학") })
        .tag(Tabs.math)
        .tabItem {
            Image(systemName: "person.2.fill")
            Text("수학")
        }

  }
    
    var society: some View {
//        Text("사회")
        KoreanView3()
            .onAppear(perform: { print("사회") })
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
//    Text("과학")
    KoreanView4()
        .onAppear(perform: { print("과학") })
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
    SetUp()
    .onAppear(perform: { print("검색") })
    .tag(Tabs.activity)
    .tabItem {
        Image(systemName: "figure.stand.line.dotted.figure.stand")
        Text("검색")
    }

  }
    
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
        .environmentObject(KoreanViewModel())
        .environmentObject(ANPJsonUpload())
    
  }
}
