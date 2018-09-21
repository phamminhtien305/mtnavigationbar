//
//  LibraryViewController.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class LibraryViewController: BaseViewController {
    @IBOutlet private weak var introView:QuotationsView!
    var _quota: [String:String]?
    convenience init(withQuota quota:[String:String]?) {
        self.init(nibName:LibraryViewController.nibName(), bundle: nil)
        _quota = quota
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigationForListBookLibrary(onView: self, withTitle: self.nibName)
        myNavigationBar?.leftButton.setImage(UIImage(named: "navi-back"), for: UIControlState())
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


extension LibraryViewController:NavigationHandle {
    func navigationBarView(_ navigationView: NavigationBarView, clickLeftMenu sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationBarView(_ navigationView: NavigationBarView, clickDeleteAll sender: AnyObject) {
        UIAlertView.show(withTitle: "Toturial", message: "Do you want delete all quotas?", cancelButtonTitle: "Cancel", otherButtonTitles: ["OK"], tap: { (alertView, index) in
            switch (index) {
            case 0:
                break
            case 1:
                self.navigationController?.popViewController(animated: true)
                break
            default:
                break
            }
        })
    }
    
}
