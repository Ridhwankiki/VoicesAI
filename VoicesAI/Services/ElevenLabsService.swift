//
//  ElevenLabsService.swift
//  VoicesAI
//
//  Created by MacBook Pro on 25/04/24.
//

import Foundation

class ElevenLabsService {
    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func generateSpeech(for text: String) async throws -> Data {
        guard let url = URL(string: Constant.fullURL(forVoice: .josha)) else {
            print("Invalid URL")
            return Data()
        }
        
        print("You are using API_KEY \(apiKey) for request to ElevenLabs")
        
        // Request Body
        let body: [String: Any] = [
            "model_id": "eleven_multilingual_v2",
            "text": text,
            "voice_settings": [
                "stability": 0.5,
                "similarity_boost": 0.8
            ]
        ]
        
        let requestBody = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        // POST Data
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "xi-api-key")
//        request.setValue("application/json", forHTTPHeaderField: <#T##String#>)
        request.httpBody = requestBody
        
        // Network Request for POST
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Failed request: \(response)")
            return Data()
        }
        
        guard(200...299).contains(httpResponse.statusCode) else {
            print("Server Returned status code \(httpResponse.statusCode)")
            return Data()
        }
        
        guard !data.isEmpty else {
            print("No Data received from response")
            return Data()
        }
        
        return data
    }
}
