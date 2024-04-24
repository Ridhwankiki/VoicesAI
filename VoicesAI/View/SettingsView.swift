//
//  SettingsView.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var geminiAIKey = ""
    @State private var elevenLabsKey = ""
    
    @State private var geminiAILink = ""
    @State private var elevenLabsLink = ""
    
    let signUpGemini = "https://ai.google.dev"
    let signUpElevenLabs = "https://elevenlabs.io/api"
    
    var body: some View {
        NavigationStack {
            Form {
                
                // MARK: - API KEYS

                Section {
                    
                    TextField("Gemini AI Key", text: $geminiAIKey)
                    TextField("Eleven Labs Key", text: $elevenLabsKey)
                    
                    
                } header: {
                    Text("API KEYS")
                } footer: {
                    Text("Please put your API Key abpve.")
                }
                
                // MARK: - LINK
                
                Section {
                    
                    Link("GET API KEY GIMINI AI", destination: URL(string: signUpGemini)!)
                        .foregroundStyle(.blue)
                    Link("GET API KEY ELEVEN LABS", destination: URL(string: signUpElevenLabs)!)
                        .foregroundStyle(.blue)
                    
                    
                } header: {
                    Text("DONT HAVE API KEY?")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    
                } label: {
                    Text("Save")
                        .padding()
                        .tint(.primary)
                }
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
