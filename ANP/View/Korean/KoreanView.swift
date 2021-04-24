//
//  KoreanView.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/04/24.
//

import SwiftUI

struct KoreanView: View {

    // 초기화 하면서 fetch 한다
    @EnvironmentObject var koreanViewModel: KoreanViewModel
    
    
    var body: some View {

        NavigationView {
            ScrollView {
                Text("국어")
                
            } // ScrollView
            .background(Color.white)
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
            .navigationBarItems(trailing: Button(action: { koreanViewModel.openNewPage.toggle() }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
            })
            .fullScreenCover(isPresented: $koreanViewModel.openNewPage) {
//                AddGrowthView()
//                    .environmentObject(studentViewModelData)
//                    .environmentObject(growthViewModelData)
//                    .environmentObject(homeViewModelData)
            }
            
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanView().environmentObject(KoreanViewModel())
    }
}
