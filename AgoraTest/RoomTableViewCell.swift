//
//  RoomTableViewCell.swift
//  AgoraTest
//
//  Created by Ray Chen on 2021/2/6.
//

import Foundation
import UIKit

class RoomTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var memberList: [String] = []
    
    @IBOutlet weak var RoomNameLable: UILabel!
    @IBOutlet weak var memberIcon: UIImageView!
    
    @IBOutlet weak var memberCountViewLable: UILabel!
    @IBOutlet weak var speakerCountViewLable: UILabel!
    
    @IBOutlet weak var memberTableView: UITableView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        memberTableView.delegate = self
        memberTableView.dataSource = self
        memberTableView.rowHeight = 44
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if memberList.count > 5 {
            return 5
        } else {
            return memberList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Cell create")
        print(memberList.count, memberList[indexPath.row])
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! RoomMemberTableViewCell
        cell.memberIdLabel.text = String(memberList[indexPath.row])
        
        return cell
    }
}


