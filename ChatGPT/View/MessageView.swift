//
//  MessageView.swift
//  ChatGPT
//
//  Created by Alexander Spurlock on 5/18/23.
//

import SwiftUI

struct MessageView: View {
    let user: String
    let message: String
    
    var body: some View {
        Group {
            if user == "You" {
                HStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                }
            } else {
                HStack {
                    Text(message)
                        .padding()
                        .foregroundColor(.indigo)
                        .cornerRadius(8)
                    Spacer()
                }
            }
        }
        .padding()
        
//        HStack {
//            Text(message)
//                .font(.body)
//                .fontWeight(.light)
//                .multilineTextAlignment(.leading)
//                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
//            Spacer()
//        }
//        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(user: "You", message: "A sample message.")
    }
}
