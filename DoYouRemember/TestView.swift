//
//  TestView.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 01.10.2022.
//

import SwiftUI

struct TestView: View {
    @State private(set) var phoneNumberIsLinked: Bool
    private var title: String {
        phoneNumberIsLinked ? "Test Rewards is here!" : "Test Rewards"
    }
    private var description: String {
        phoneNumberIsLinked
            ? "You will earn 4 points on this purchase"
            : "Earn 4 points on this order by entering your phone number to enroll in Test Rewards! "
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image("star")
                .frame(width: 26, height: 28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17))
                    .bold()
                
                Text(description)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                if !phoneNumberIsLinked {
                    Button(action: {
                        print("terms button did tap")
                    }) {
                        Text("Terms of Use")
                            .underline()
                            .font(.system(size: 13))
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if !phoneNumberIsLinked {
                Button("Enroll") {
                    print("enroll button did tap")
                }
                .frame(width: 60, height: 35, alignment: .trailing)
                .foregroundColor(Color(red: 0.95, green: 0.39, blue: 0.29))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TestView(phoneNumberIsLinked: false)
                .listRowInsets(EdgeInsets())
            TestView(phoneNumberIsLinked: true)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.grouped)
    }
}
