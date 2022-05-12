//
//  RCVideoRoomService.swift
//  RCSceneExample
//
//  Created by shaoshuai on 2022/3/29.
//

import Foundation
import RCSceneRoom

let service = RCSceneCallService()

class RCSceneCallService {
    func login(phone: String, completion: @escaping (Result<Void, NetError>) -> Void) {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        let api = RCLoginService.login(mobile: phone,
                                       code: "123456",
                                       userName: nil,
                                       portrait: nil,
                                       deviceId: deviceId,
                                       region: "+86",
                                       platform: "mobile")
        
        loginProvider.request(api) { result in
            switch result.map(RCSceneWrapper<User>.self) {
            case let .success(wrapper):
                let user = wrapper.data!
                UserDefaults.standard.set(user: user)
                UserDefaults.standard.set(authorization: user.authorization)
                UserDefaults.standard.set(rongCloudToken: user.imToken)
                completion(.success(()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    
}
