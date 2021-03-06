//
//  AppConfigs.swift
//  RCE
//
//  Created by shaoshuai on 2022/3/24.
//

import RCSceneRoom

class AppConfigs {
    static func config() {
        configRCKey()
        configBaseURL()
        configBusinessToken()
    }
    
    static func configRCKey() {
        Environment.rcKey = "pvxdm17jpw7ar"
    }
    
    static func configBaseURL() {
        Environment.url = URL(string: "https://rcrtc-api.rongcloud.net/")!
    }
    
    static func configBusinessToken() {
        Environment.businessToken = "vStHYPdrQoImm-7Ur0ks1g"
    }
}
