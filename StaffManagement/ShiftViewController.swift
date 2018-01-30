//
//  ShiftViewController.swift
//  StaffManagement
//
//  Created by Ritz on 2018-01-28.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

import UIKit


class ShiftViewController: ViewController {

    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcome.text = "Hi " + name + "!"
print("here")
        print(name)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
