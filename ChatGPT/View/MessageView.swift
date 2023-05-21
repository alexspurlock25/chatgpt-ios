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
        if user == "You" {
            HStack {
                Text(message)
                    .foregroundColor(Color.blue)
                Spacer()
            }
            .padding()
        } else {
            HStack {
                Text(message)
                Spacer()
            }
            .padding()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(user: "Bot", message: "This is a message.")
    }
}
