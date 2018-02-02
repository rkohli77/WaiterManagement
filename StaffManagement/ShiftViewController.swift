//
//  ShiftViewController.swift
//  StaffManagement
//
//  Created by Ritz on 2018-01-28.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

import UIKit


class ShiftViewController: ViewController, UITabBarDelegate, UITableViewDataSource {


    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    var name = ""
    lazy var insertWaiterName = InsertWaiter()
    var shiftArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcome.text = "Hi " + name + "!"
        shiftArray = insertWaiterName.getShifts()
        print(shiftArray.count)
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveShift(_ sender: UIButton) {
        let locale = NSTimeZone.init(abbreviation: "EST")
        NSTimeZone.default = locale! as TimeZone
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MMM d, h:mm a"
        let strStartDate = timeFormatter.string(from: startDate.date)
        let strEndDate = timeFormatter.string(from: endDate.date)
        if strStartDate.compare(strEndDate) == .orderedDescending {
            print("First Date is greater then second date. Error!")
        }
        insertWaiterName.saveWaiterShift(nameStr: name, startDate: strStartDate, endDate: strEndDate)
        shiftArray = insertWaiterName.getShifts()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shiftArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = shiftArray[indexPath.row]
        return cell!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
