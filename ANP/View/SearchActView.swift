//
//  SearchAct.swift
//  ANP
//
//  Created by macbook on 2021/04/30.
//
import SwiftUI

struct SearchActView: View {
    @EnvironmentObject var searchData: SearchViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("검색", text: $searchData.query)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .background(Color.gray)
                        .opacity(0.3)
                } // HStack
                .padding(.vertical,10)
                .padding(.horizontal)
                Divider()
            
                
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
                                        }else {
                                            Image(systemName: "square.grid.2x2.fill").foregroundColor(.pink).font(.system(size: 25)).opacity(0.8)
                                        }
                                        
                                        Text(anp.actName).font(.system(size: 18))
                                        Spacer()
                                        Text(String(anp.time)).foregroundColor(.gray).font(.system(size: 13))
                                    }
                                    HStack {
                                        Text(String(anp.activity.replacingOccurrences(of: "\n\n", with: ""))).foregroundColor(.gray).frame(width: 300, height: 50, alignment: .leading).font(.system(size: 13)).padding(.horizontal, 3)
                                        Spacer()
                                    }
                                    NavigationLink(destination: SearchDetailView(anp: anp)) {
                                        EmptyView()
                                    }
                                    .frame(width: 0, height: 0)
                                    .hidden()
                                } // VStack
                            
                                
                            } // section
                            
                        } // ForEach
                    }

                } // if
                Spacer()
            } // VStack
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
            .onAppear {
                // 취소할때 집어넣으니 dismiss 때문에 에러남
                searchData.reset()
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()

                    }, label: {
                        Text("취소")
                    })
                } // ToolbarItem
            } // toolbar
        } // navigationView

    }
}

struct SearchActView_Previews: PreviewProvider {
    static var previews: some View {
        SearchActView()
            .environmentObject(SearchViewModel())
    }
}
