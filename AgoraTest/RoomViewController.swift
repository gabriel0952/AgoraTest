//
//  RoomViewController.swift
//  AgoraTest
//
//  Created by Ray Chen on 2021/2/6.
//

import UIKit
import AgoraRtcKit

class RoomViewController: UIViewController, AgoraRtcEngineDelegate {

    // 定義 agoraKit 變量
    private var agoraKit: AgoraRtcEngineKit!
    
    let AppId: String = "70a741953e614cce9bfcacf822d06850"
    let token: String = "00670a741953e614cce9bfcacf822d06850IAD3/1xAcmKjkZeqMgBTOvPyFYwH8ySXLAxBfOKYna+5FIUPtm4AAAAAEABFd1n8soceYAEAAQCyhx5g"
    
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(num)
        
        initializeAgoraEngine()
        joinChannel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        endChannel()
    }
    
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AppId, delegate: self)
        agoraKit.setChannelProfile(.communication)
    }
    
    func joinChannel() {
        agoraKit?.joinChannel(
            byToken: token,
            channelId: "OwnVoice",
            info: nil,
            uid: 0,
            joinSuccess: { (channel, uid, elapsed) in
        })
    }
    
    func endChannel() {
        agoraKit?.leaveChannel(nil)
        AgoraRtcEngineKit.destroy()
    }

}
