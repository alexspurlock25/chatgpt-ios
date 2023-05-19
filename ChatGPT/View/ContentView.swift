//
//  ContentView.swift
//  ChatGPT
//
//  Created by Alexander Spurlock on 5/18/23.
//

import SwiftUI

struct Response: Codable {
    let text: String
}

struct Message: Hashable {
    let sender: String
    let text: String
}

struct ContentView: View {
    @ObservedObject var chatViewModel = ChatViewModel()

    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatViewModel.conversation, id: \.self) { message in
                    VStack {
                        MessageView(user: message.sender, message: message.text)
                    }
                }
            }
        
            Spacer()
            HStack {
                TextField("Enter anything...", text: $chatViewModel.userPrompt)
                    .textFieldStyle(.roundedBorder)
                Button("Go") {
                    chatViewModel.fetchResponse()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
