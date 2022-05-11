//
//  ViewController.swift
//  RCSceneExample
//
//  Created by shaoshuai on 2022/3/19.
//

import UIKit
import SVProgressHUD
import RCSceneRoom
import RongIMKit
import RCSceneCall

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RCSceneCall"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false;
        connection()
    }

    @IBAction func show() {
        let callVc = DialViewController(type: .audio);
        self.present(callVc, animated: true)
    }
    
}

/// Connection
extension ViewController {
    private func connection() {
        if RCIM.shared().getConnectionStatus() == .ConnectionStatus_Connected {
            return
        }
        guard let token = UserDefaults.standard.rongToken() else {
            return performSegue(withIdentifier: "Login", sender: nil)
        }
        RCIM.shared().initWithAppKey(Environment.rcKey)
        RCIM.shared().connect(withToken: token) { code in
            debugPrint("RCIM db open failed: \(code.rawValue)")
        } success: { userId in
            debugPrint("userId: \(userId ?? "")")
//            self.refresh()
        } error: { errorCode in
            debugPrint("RCIM connect failed: \(errorCode.rawValue)")
        }
    }
}
