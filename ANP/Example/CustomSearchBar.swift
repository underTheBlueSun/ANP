//
//  CustomSearchBar.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/29.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData: SearchUser
    
    var body: some View {
//        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.white)
                TextField("search", text: $searchData.query)
                    .autocapitalization(.none)
            } // HStack
            .padding(.vertical,10)
            .padding(.horizontal)
            
//            if !searchData.searchedUser.isEmpty {
//                ScrollView(.vertical, showsIndicators: true) {
//                    LazyVStack(alignment: .leading, spacing: 12) {
//                        // safe wrap ...
//                        ForEach(searchData.searchedUser, id: \.self) { user in
//                            VStack(alignment: .leading, spacing: 6) {
//                                Text(user.actName)
//                                Divider()
//                            }
//                            .padding(.horizontal)
//                            .onAppear {
//                                // stopping search until 3rd page
//                                // you can change for your own ...
//                                if user.uuid == searchData.searchedUser.last?.uuid && searchData.page <= 3 {
//                                    searchData.page += 1
//                                    searchData.find()
//                                }
//                            } // VStack
//                        } // ForEach
//                    } // LazyVStack
//                    .padding(.top)
//                } // ScrollView
//                .frame(height: 240)
//            } // if
            
            if !searchData.searchedANP.isEmpty {
//                ScrollView(.vertical, showsIndicators: true) {
//                    LazyVStack(alignment: .leading, spacing: 12) {
                Form {
                    // safe wrap ...
                    ForEach(searchData.searchedANP, id: \.self) { anp in
                        Section {
                            VStack {
                                HStack {
                                    // 공통인지 일부 공통인지등에 따라 아이콘 색깔 다르게
                                    if anp.range == "all" {
                                        Image(systemName: "square.grid.2x2.fill").foregroundColor(.eliBlue).font(.system(size: 25)).opacity(0.8)
                                    }else if anp.range == "없음" {
                                        Image(systemName: "square.grid.2x2.fill").foregroundColor(.pink).font(.system(size: 25)).opacity(0.8)
                                    }else {
                                        Image(systemName: "square.grid.2x2.fill").foregroundColor(.green).font(.system(size: 25)).opacity(0.8)
                                    }
                                    
                                    Text(anp.actName).font(.system(size: 18))
                                    Spacer()
                                    Text(String(anp.time)).foregroundColor(.gray).font(.system(size: 13))
                                }
                                HStack {
                                    Text(String(anp.activity.replacingOccurrences(of: "\n\n", with: ""))).foregroundColor(.gray).frame(width: 300, height: 50, alignment: .leading).font(.system(size: 13)).padding(.horizontal, 3)
                                    Spacer()
                                }
                                NavigationLink(destination: DetailActView(anp: anp)) {
                                    EmptyView()
                                }
                                .frame(width: 0, height: 0)
                                .hidden()
                            } // VStack
                            
//                            VStack(alignment: .leading, spacing: 6) {
//                                Text(user.actName)
//                                Divider()
//                            }
//                            .padding(.horizontal)
//                            .onAppear {
//                                // stopping search until 3rd page
//                                // you can change for your own ...
//                                if user.uuid == searchData.searchedANP.last?.uuid && searchData.page <= 3 {
//                                    searchData.page += 1
//                                    searchData.find()
//                                }
//                            } // onAppear
                            
                        } // section
                        
                    } // ForEach
                } // form
                        
//                    } // LazyVStack
//                    .padding(.top)
//                } // ScrollView
//                .frame(height: 240)
            } // if
            
//        } // VStack
//        .background(Color(.gray))
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .padding()
    }
}

