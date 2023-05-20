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
        HStack {
            Text(message)
            Spacer()
        }
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let conversation: [Message] = [
            Message(sender: "User", text: "Hello!"),
            Message(sender: "Bot", text: "Hi there!"),
            Message(sender: "User", text: "How are you?"),
            Message(sender: "Bot", text: "I'm good. Thanks!")
        ]
        
        ForEach(conversation, id: \.self) { message in
            MessageView(user: message.sender, message: message.text)
        }

    }
}
