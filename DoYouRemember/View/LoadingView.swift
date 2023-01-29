//
//  LoadingView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 08.10.2022.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    private let heights: [CGFloat] = [8, 5, 14, 31, 13, 32, 9]
    
    var body: some View {
        VStack(alignment: .center, spacing: 19) {
            
            HStack(spacing: 2) {
                ForEach(Array(heights.enumerated()), id: \.offset) { item in
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(isLoading ? .gray : .black)
                        .frame(width: 2, height: item.element)
                        .animation(getLoadingAnimation(index: item.offset))
                }
            }
            .padding(.horizontal, 3)
            
            Text("Searching for translation...")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
        }
        .onAppear() {
            isLoading.toggle()
        }
    }
}

// MARK: - Private Methods
private extension LoadingView {
    func getLoadingAnimation(index: Int) -> Animation {
        Animation.default
            .repeatForever(autoreverses: false)
            .speed(0.4)
            .delay(0.07 * Double(index))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
