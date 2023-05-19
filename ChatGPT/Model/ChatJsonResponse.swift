//
//  ChatJsonResponse.swift
//  ChatGPT
//
//  Created by Alexander Spurlock on 5/18/23.
//

import Foundation

struct ChatJsonResponse: Codable {
    let choices: [Choice]
    let created: Int
    let id: String
    let model: String
    let object: String
    let usage: Usage
    
    struct Choice: Codable {
        let finishReason: String
        let index: Int
        let message: Message
        
        enum CodingKeys: String, CodingKey {
            case finishReason = "finish_reason"
            case index, message
        }
        
        struct Message: Codable {
            let content: String
            let role: String
        }
    }
    
    struct Usage: Codable {
        let completionTokens: Int
        let promptTokens: Int
        let totalTokens: Int
        
        private enum CodingKeys: String, CodingKey {
            case completionTokens = "completion_tokens"
            case promptTokens = "prompt_tokens"
            case totalTokens = "total_tokens"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case choices, created, id, model, object, usage
    }
}
