//
//  Test.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/01.
//

import SwiftUI

struct Test: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("aaaa11")
                List {
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Text("Navigate")
                        })
                    Text("aaaa")
//                    Section {
//                        Text("aaaa")
//                    }
                }
                .listStyle(InsetGroupedListStyle())
                Spacer()
                
            }//vstack
            
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
