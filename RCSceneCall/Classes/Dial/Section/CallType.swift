//
//  CallType.swift
//  RCE
//
//  Created by 叶孤城 on 2021/6/30.
//

import Foundation

public enum CallType: Int {
    case audio = 0
    case video = 1
    
    var mediaType: RCCallMediaType {
        switch self {
        case .audio: return .audio
        case .video: return .video
        }
    }
}
