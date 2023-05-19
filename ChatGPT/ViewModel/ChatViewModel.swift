//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Alexander Spurlock on 5/18/23.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var conversation: [Message] = []
    @Published var userPrompt: String = ""
    
    func fetchResponse() {
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(Secrets.openAiApiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestBody: [String: Any] = [
            "messages": [
                 ["role": "system", "content": "Act as if your an evil professor and everything you say has to be less than or equal to 200 words."],
                ["role": "user", "content": userPrompt]
            ],
            "max_tokens": 200,
            "model": "gpt-3.5-turbo"
        ]
        
        guard let encodedRequestBody = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Could not encode json object.")
            return
        }
        
        request.httpBody = encodedRequestBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("There was an error \(error)")
                return
            }
            
            if let data = data, error == nil {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(ChatJsonResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        let content = response.choices.first?.message.content ?? "n/a"
                    
                        self.conversation.append(Message(sender: "You", text: self.userPrompt))
                        self.conversation.append(Message(sender: "AI", text: content))
                    }
                } catch {
                    print("There was an error decoding.")
                }
            }
        }
        task.resume()
    }
}
