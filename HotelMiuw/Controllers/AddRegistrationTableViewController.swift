//
//  AddRegistrationTableViewController.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 17.01.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    //MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel : UILabel!
    @IBOutlet var checkInDatePicker : UIDatePicker!
    @IBOutlet var checkOutLabel : UILabel!
    @IBOutlet var checkOutDatePicker : UIDatePicker!
    
    
    @IBOutlet var numberOfAdultsLabel : UILabel!
    @IBOutlet var numberOfAdultsStepper : UIStepper!
    @IBOutlet var numberOfChildrensStepper : UIStepper!
    @IBOutlet var numberOfChildrensLabel : UILabel!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    
    
    //MARK: - Properties
    let checkInDatelLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDatelLabelCellIndexPath = IndexPath(row: 2, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown : Bool = false{
        didSet{
            //isHidden: Bir arayüz elemanının görünürlük bilgisi.
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown : Bool = false{
        didSet{
            //isHidden: Bir arayüz elemanının görünürlük bilgisi.
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    var roomType : RoomType?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Not: Date() o anın tarihini verir(saat bilgisi dahil).
        //Check-In tarihini bugünün gecesi olarak ayarla.
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        //Seçilebilecek en küçük tarihi ayarlar.
        checkInDatePicker.minimumDate = midnightToday
        //Seçili olan tarihi ayarlar.
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        
        //Storyboard'da ayarladğımız geçici değerleri, on anki Stepper değeri ile günceller.
        updateNumberOfGuests()
        
        updateRoomType()
    }
    
    //MARK: - Functions
    //Ekrana çizmekte olduğu hücrenin yüksekliğini ayarlar.
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown{
                return 216
            }else{
                return 0
            }
            
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown{
                return 216
            }else{
                return 0
            }
            
        default:
            //Picker hücreleri dışında kalan tüm hücrelerin yüksekliği.
            return 44
            
        }
    }
    //didselectrow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçili olan hücrenin, seçili olma durumunu sonlandırır.
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInDatelLabelCellIndexPath:
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            }else if isCheckInDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }else {
                isCheckInDatePickerShown = true
            }
            
            // Değişkenlerdeki değişim ile, heightForRow fonksiyonu tekrardan çalıştırılır.
            // Fakat yğkseklik değişimleri animasyon ile sağlanır.
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case checkOutDatelLabelCellIndexPath:
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            }else if isCheckInDatePickerShown {
                isCheckOutDatePickerShown = true
                isCheckInDatePickerShown = false
            }else {
                isCheckOutDatePickerShown = true
            }
            
            // Değişkenlerdeki değişim ile, heightForRow fonksiyonu tekrardan çalıştırılır.
            // Fakat yğkseklik değişimleri animasyon ile sağlanır.
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
        func updateDateViews(){
            //.short --> saat
            //.medium --> ay gün , yıl
            //. lar enumdur
            
            //Otelimizde min bir gece konaklama yapılacağı için checkoutdatepickerin min datesi
            //o an seçili olan checkindatepickerın 24 saat ilerisi olmalıdır.
            
            //addingtimeinterval : var olan bir date nesnesinin üzerine belirtilen miktarda saniye ekler.
            let oneDay : Double = 24 * 60 * 60
            checkOutDatePicker.minimumDate = checkOutDatePicker.date.addingTimeInterval(oneDay)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
            checkOutLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
            
        }
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrensLabel.text = "\(Int(numberOfChildrensStepper.value))"
    }
    
    func updateRoomType(){
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }else {
            roomTypeLabel.text = "Not Set"
        }
    }
        //MARK: - Actions
        @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
            let firstName = firstNameTextField.text!
            let lastName = lastNameTextField.text!
            let email = emailTextField.text!
            let checkInDate = checkInDatePicker.date
            let checkOutDate = checkOutDatePicker.date
            let numberOfAdults = Int(numberOfAdultsStepper.value)
            let numberOfChildren = Int(numberOfChildrensStepper.value)
            let hasWifi = wifiSwitch.isOn
            
        }
        
        @IBAction func datePickerValueChanged(_ picker: UIDatePicker){
            updateDateViews()
        }
    
        @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        updateNumberOfGuests()
    }
        @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    }

