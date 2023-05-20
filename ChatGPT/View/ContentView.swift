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
    @State private var contentHeight: CGFloat = 30
    @State private var isEditing = false

    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatViewModel.conversation, id: \.self) { message in
                    MessageView(user: message.sender, message: message.text)
                    Divider()
                }
            }
        
            Spacer()
            HStack {
                Spacer()
                TextEditor(text: $chatViewModel.userPrompt)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    )
                    .onTapGesture {
                        isEditing = true
                    }
                    .onChange(of: chatViewModel.userPrompt) { newValue in
                        chatViewModel.userPrompt = newValue
                    }
                    
                
                VStack {
                    Button(action: {
                        chatViewModel.fetchResponse()
                    }, label: {
                        Text("Go")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    })
                    .buttonStyle(.borderedProminent)
                    
                    Button("Clear") {
                        chatViewModel.userPrompt = ""
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: 70, maxHeight: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 100)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
