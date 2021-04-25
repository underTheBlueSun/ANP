//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
  @EnvironmentObject private var store: Store
  
//  @State private var quickOrder: Product?
//  @State private var showingFavoriteImage: Bool = true
  
  // MARK: Body
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        
        productList
      }
      .navigationBarTitle("과일마트")
    }
//    .popupOverContext(item: $quickOrder, style: .blur, content: popupMessage(product:))
  }
}


private extension Home {
  // MARK: View

 
  var productList: some View {
    List {
      ForEach(store.products) { product in
        Text(product.imageName)
      }
      .listRowBackground(Color.background)
    }
    .background(Color.background)
  }

}

// MARK: - Previews

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home().environmentObject(Store())
//    Preview(source: Home())
//      .environmentObject(Store())
  }
}
