//
//  Home.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/29.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUser()
    var body: some View {
        VStack {
            CustomSearchBar(searchData: searchData)
            Spacer()
        }
        .onChange(of: searchData.query) { (newData) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if newData == searchData.query {
                    if searchData.query != "" {
//                        searchData.page = 1
                        searchData.find()
                        
                    }else {
                        searchData.searchedANP.removeAll()
                    }
                }
            }
        }
    }
}
