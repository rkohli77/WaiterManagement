//
//  AddWaiterViewController.swift
//  StaffManagement
//
//  Created by Ritz on 2018-01-27.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

import UIKit


class AddWaiterViewController: ViewController {

    @IBOutlet weak var waiterName: UITextField!
    @IBOutlet weak var saveWaiter: UIButton!
    lazy var insertWaiterName = InsertWaiter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveClicked(_ sender: UIButton) {
        let name = self.waiterName.text
        if let waiterName = name {
            insertWaiterName.saveWaiterName(nameStr: waiterName)
        }
        
        
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
