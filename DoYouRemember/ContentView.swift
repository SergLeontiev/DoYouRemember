//
//  ContentView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 01.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AddWordView(viewModel: AddWordViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
