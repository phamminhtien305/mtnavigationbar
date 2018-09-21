//
//  HomeViewController.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet private weak var tableView:UITableView!
    @IBOutlet private weak var paddingTop:NSLayoutConstraint!
    var controller: HomeController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNaviBarSearchButton(onView: self, withTitle: self.nibName)
        controller = HomeController(initWithTargetTable: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        paddingTop.constant = MyAppLication.navigationBarHeight
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

extension HomeViewController: NavigationHandle {
    func navigationBarView(_ navigationView: NavigationBarView, clickLeftMenu sender: AnyObject) {
        UIAlertView.show(withTitle: "Toturial", message: "Coming soon!", cancelButtonTitle: "OK", otherButtonTitles: nil, tap: { (alertView, index) in
            
        })
    }
    
    func navigationBarView(_ navigationView: NavigationBarView, clickSearch sender: AnyObject) {
        let searchViewController = SearchViewController(usingNib: SearchViewController.nibName())
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
