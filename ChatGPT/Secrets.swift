//
//  Secrets.swift
//  ChatGPT
//
//  Created by Alexander Spurlock on 5/18/23.
//

import Foundation

struct Secrets {
    static let openAiApiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] ?? ""
}
