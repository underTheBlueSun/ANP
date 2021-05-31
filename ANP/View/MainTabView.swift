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
            .tag(Tabs.korean)
            .tabItem {
              Image(systemName: "book.fill")
              Text("국어")
             }
    }
    
  var math: some View {
    MathView()
        .tag(Tabs.math)
        .tabItem {
            Image(systemName: "chart.bar.xaxis")
            Text("수학")
        }

  }
    
    var society: some View {
        SocietyView()
        .tag(Tabs.society)
          .tabItem {
              Image(systemName: "person.2.fill")
              Text("사회")
          }
    }
  
  var science: some View {
    ScienceView()
      .tag(Tabs.science)
        .tabItem {
            Image(systemName: "gyroscope")
            Text("과학")
        }
  }
  
  var setup: some View {
    SetUp()
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
        .environmentObject(CurriculumViewModel())
        .environmentObject(JsonUpload())
    
  }
}
