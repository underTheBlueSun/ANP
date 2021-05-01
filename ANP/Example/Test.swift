//
//  Test.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/05/01.
//

import SwiftUI

struct Test: View {
    
    @State private var tip = "1sdfsdfsdfsdfsdafsdfsdsdfsdf동해물과 백두산이 마르고 닳도록 하나님!\nsdfs111dfsdafsdfsdafsda\n"
    
    var body: some View {
        VStack(spacing:0){
            Text("Hello, World!")
            Text("111111").padding(0)
            TextEditor(text: $tip).font(.system(size: 13)).foregroundColor(.gray).padding(.vertical, 0)
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
