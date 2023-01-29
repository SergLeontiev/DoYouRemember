//
//  ErrorView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 28.01.2023.
//

import SwiftUI

struct ErrorView: View {
    private let error: Error
    
    init(error: Error) {
        self.error = error
    }
    
    var body: some View {
        Text("Error: \(error.localizedDescription)")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: NetworkError.network(description: "test description"))
    }
}
