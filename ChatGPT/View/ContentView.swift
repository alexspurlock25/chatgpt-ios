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
            List {
                ForEach(chatViewModel.conversation, id: \.self) { message in
                    MessageView(user: message.sender, message: message.text)
                }
            }
            .listStyle(.plain)
        
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                    
                    TextEditor(text: $chatViewModel.userPrompt)
                        .padding(5)
                        .background(Color.clear)
                        .cornerRadius(10)
                }
                .frame(maxHeight: 100)
                
                Button(action: {
                    chatViewModel.fetchResponse()
                    chatViewModel.userPrompt = ""
                }, label: {
                    Text("Go")
                        .frame(maxWidth: 30)
                        .padding()
                })
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
