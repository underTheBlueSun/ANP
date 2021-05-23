//
//  MainTabView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
// ......

import SwiftUI

struct MainTabView: View {

//    @EnvironmentObject var koreanViewModel: KoreanViewModel
//    @EnvironmentObject private var aNPJsonUpload: ANPJsonUpload
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.tertiaryLabel
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    private enum Tabs {
      case korean, math, society, science, setup
    }

    @State private var selectedTab: Tabs = .korean
    
    
  var body: some View {
    
    TabView(selection: $selectedTab) {
        
      Group {
        korean
        math
        society
        science
        setup
      }
      
    }
    .accentColor(.eliBlue)
    .edgesIgnoringSafeArea(.top)
    .onAppear(perform: {
    })
  }
}

private extension MainTabView {
    
    var korean: some View {
        KoreanView()
            .onAppear(perform: {
//                print("국어")
                
            })
//            .environmentObject(koreanViewModel)
//            .environmentObject(Store)
            .tag(Tabs.korean)
            .tabItem {
              Image(systemName: "book.fill")
              Text("국어")
             }
    }
    
  var math: some View {

//    Text("수학")
    MathView()
        .onAppear(perform: {
//            print("수학")
            
        })
        .tag(Tabs.math)
        .tabItem {
            Image(systemName: "chart.bar.xaxis")
            Text("수학")
        }

  }
    
    var society: some View {
//        Text("사회")
        SocietyView()
            .onAppear(perform: { print("사회") })
//        GrowthView()
//            .environmentObject(homeViewModelData)
//            .environmentObject(studentViewModelData)
//            .environmentObject(growthViewModelData)
        .tag(Tabs.society)
          .tabItem {
              Image(systemName: "person.2.fill")
              Text("사회")
          }
    }
  
  var science: some View {
//    Text("과학")
    ScienceView()
        .onAppear(perform: { print("과학") })
//    SubjectView()
//        .environmentObject(homeViewModelData) 
//        .environmentObject(studentViewModelData)
//        .environmentObject(subjectViewModelData)

      .tag(Tabs.science)
        .tabItem {
            Image(systemName: "gyroscope")
            Text("과학")
        }
  }
  
  var setup: some View {
    SetUp()
    .onAppear(perform: { print("설정") })
    .tag(Tabs.setup)
    .tabItem {
        Image(systemName: "gearshape.fill")
        Text("설정")
    }

  }
    
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
//        .environmentObject(KoreanViewModel())
        .environmentObject(CurriculumViewModel())
        .environmentObject(JsonUpload())
    
  }
}
