//
//  SelectRoomTableViewController.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 22.01.2023.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate: class {
    // class: Protokolün yalnızca Class'lar tarafından
    // desteklenebileceğini belirtmek için kullanılır.
    func didSelect(roomType: RoomType)
}

class SelectRoomTableViewController: UITableViewController {
    
    

    // MARK: - UI Elements
    
    // MARK: - Properties
    
    var selectedRoomType: RoomType?
    //nil olduğu için optional yani "?"
    weak var delegate: SelectRoomTypeTableViewControllerDelegate?
    //weak mülakatlarda sorulurmuş :)
    //arada strong bir relation kurmak istemiyoruz
    // delegete başka bir controllerın refaransı selectroomun değil o yüzden iki controller arasında anlamsız bir strong ilişki kurmak istemiyoruz.
    //retain cycledan uzak durmak için..
    
    
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
        
        // O an çizilmekte olan oda türü, önceden seçilen oda türü mü?
        if roomType == selectedRoomType {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        //bu araya bu üsttekini yazdık checkmark ekleyebilmek için...
        
        return cell
    }
    
    //didselectrow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //üstüne bastığımızda gitmesini //sağlıyor.
        
        selectedRoomType = RoomType.all[indexPath.row]
        
        delegate?.didSelect(roomType: selectedRoomType!)
        //yukarıdaki kod satırını yazarak bir önceki sayfaya sinyal gönderdik.
        
        tableView.reloadData() //checkmark için reload data yaptık ..
    }
    
    // MARK: - Actions
    
   


}
