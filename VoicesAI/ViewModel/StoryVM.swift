//
//  StoryVM.swift
//  VoicesAI
//
//  Created by MacBook Pro on 25/04/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class StoryVM: ObservableObject {
    @Published var storyText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - GENERATE STORY
    
    func generateStory(topic: Topics, mood: Mood) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        storyText = ""
        
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        
        guard !apiKey.isEmpty else {
            errorMessage = "API KEY is missing. Please set it in Setting Page!"
            return
            
        }
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let topicString = topic.rawValue.capitalized
        let moodString = mood.rawValue.capitalized
        
        let prompt = "Tuliskan Quote atau kutipan tentang \(topicString) dengan mood emosi \(moodString)."
        
        do {
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                storyText = text
            }
        } catch {
            errorMessage = "Failed to generetae story: \(error.localizedDescription)"
        }
    }

}
