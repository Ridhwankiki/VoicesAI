//
//  Constant.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.elevenLabs.io"
    static let appVersion = "v1"
    
    enum Endpoint: String {
        case textToSpeech = "text-to-speech"
        case speechToSpeech = "speech-to-speech"
    }
    
    enum VoiceID: String {
        case josha = "kBag1HOZlaVBH7ICPE8x"
    }
    
    /// let urlString =  Constant.fullURL(forVoice: .thomas)
    ///
    static func fullURL(forVoice voice: VoiceID) -> String {
        
        return baseURL + appVersion + "/" + Endpoint.textToSpeech.rawValue + "/" + voice.rawValue
    }
}
