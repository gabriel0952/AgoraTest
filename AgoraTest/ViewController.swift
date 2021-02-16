//
//  ViewController.swift
//  AgoraTest
//
//  Created by Ray Chen on 2021/2/5.
//

import UIKit
import AgoraRtcKit

class ViewController: UIViewController, AgoraRtcEngineDelegate, UITableViewDelegate, UITableViewDataSource {

    let sArray = ["1", "2", "3"]
    let roomTitleArray = ["第一聊天室", "Second Room Title", "我是房間名稱"]
    let roomMemberCount = [5, 6, 3]
    let roomSpeakerCount = [2, 3, 2]
    let memberList = [["Andyyyy", "Harry", "Aditi", "Alyssa", "Julia"], ["GaRy", "Coral", "Doris", "Elva", "Emma", "Jamie"], ["Bob8787", "Angela", "Constance"]]
    
    @IBOutlet weak var RoomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("start APP")
        
        RoomTableView.delegate = self
        RoomTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoomTableViewCell
        
        cell.memberList = memberList[indexPath.row]
        cell.RoomNameLable.text = roomTitleArray[indexPath.row]
        cell.memberCountViewLable.text = String(roomMemberCount[indexPath.row])
        cell.speakerCountViewLable.text = String(roomSpeakerCount[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRoomSegue" {
            if let indexPath = RoomTableView.indexPathForSelectedRow {
                let eng = segue.destination as! RoomViewController
                eng.num = Int(sArray[indexPath.row])!
                print(sArray[indexPath.row])
            }
        }
    }
}

