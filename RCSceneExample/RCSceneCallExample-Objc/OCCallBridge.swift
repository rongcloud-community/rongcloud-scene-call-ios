//
//  VoiceRoom.swift
//  RCSceneExample-Objc
//
//  Created by hanxiaoqing on 2022/4/26.
//

import Foundation
import RCSceneRoom
import RCSceneCall


@objc public protocol LoginBridgeDelegate {
    @objc func loginCompletion(result: String?, error: NSError?);
}

@objc public class LoginBridge: NSObject {
    @objc weak var delegate: LoginBridgeDelegate?
    
    @objc public func login(mobile: String) {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        let api = RCLoginService.login(mobile: mobile,
                                       code: "123456",
                                       userName: nil,
                                       portrait: nil,
                                       deviceId: deviceId,
                                       region: "+86",
                                       platform: "mobile")
        
        loginProvider.request(api) { result in
            switch result.map(RCNetworkWrapper<User>.self) {
            case let .success(wrapper):
                let user = wrapper.data!
                UserDefaults.standard.set(user: user)
                UserDefaults.standard.set(authorization: user.authorization)
                UserDefaults.standard.set(rongCloudToken: user.imToken)
                self.delegate?.loginCompletion(result: "success", error: nil)
            case let .failure(error):
                let ocErr = NSError(domain: "login", code: -1, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
                self.delegate?.loginCompletion(result: nil, error: ocErr)
            }
        }
    }
}



@objc public class SceneCallBridge: NSObject {
    
    @objc public func userDefaultsSavedToken() -> String {
        UserDefaults.standard.rongToken()  ?? ""
    }
    
    @objc public func showDialVc(fromVc: UIViewController) {
        let callVc = DialViewController(type: .audio);
        fromVc.present(callVc, animated: true)
    }
}
