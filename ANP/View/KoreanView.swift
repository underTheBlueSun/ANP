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
    
    @EnvironmentObject private var store: Store
    
    
    var body: some View {

        NavigationView {
//            ScrollView {
                List {
                  ForEach(store.products) { product in
                    HStack {
                        TextField("주소", text: $koreanViewModel.test1).frame(width: 100)
                        Text(product.imageName)
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 150, height: 100)
                            .cornerRadius(15)
                    }
//
//                    HStack {
//                      ProductRow(product: product, quickOrder: self.$quickOrder)
//                      NavigationLink(destination: ProductDetailView(product: product)) {
//                        EmptyView()
//                      }.frame(width: 0).hidden()
//                    }
                  }
                  .listRowBackground(Color.background)
                }
                .background(Color.background)
                
//            } // ScrollView
            .background(Color.white)
            .navigationBarTitle("홈", displayMode: .inline)
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
//            .navigationBarItems(trailing: Button(action: { koreanViewModel.openNewPage.toggle() }) {
//                Image(systemName: "plus.circle.fill")
//                    .font(.title2)
//            })
                    .navigationBarItems(trailing: HStack {
                        TextField("주소", text: $koreanViewModel.test1).frame(width: 100)
                        Button(action: { koreanViewModel.openNewPage.toggle() }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                    })
//            .fullScreenCover(isPresented: $koreanViewModel.openNewPage) {

//            }
            
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanView()
//            .environmentObject(KoreanViewModel())
            .environmentObject(Store())
    }
}

