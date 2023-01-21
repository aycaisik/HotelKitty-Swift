//
//  SelectRoomTableViewController.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 22.01.2023.
//

import UIKit

class SelectRoomTableViewController: UITableViewController {

    // MARK: - UI Elements
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    //numberofsection
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    //  1 tane olduğu için yazmasak da olurdu..
    //Numberofrow
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }
    //cellforrow *hücre oluşturuyoruz*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell")!
        let roomType = RoomType.all[indexPath.row]
        
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        
        return cell
    }
    
    // MARK: - Actions
    
   


}
