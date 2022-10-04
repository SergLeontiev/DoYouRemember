//
//  ContentView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 01.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            TestView(phoneNumberIsLinked: false)
                .listRowInsets(EdgeInsets())
            TestView(phoneNumberIsLinked: true)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
