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
                    Link("GET API KEY ELEVEN LABS", destination: URL(string: signUpElevenLabs)!)
                    
                    
                } header: {
                    Text("DONT HAVE API KEY?")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }
            }
            .navigationTitle("CONFIGURATION")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button {
                    
                } label: {
                    Text("SAVE")
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
