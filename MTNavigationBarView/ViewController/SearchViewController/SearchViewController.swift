//
//  SearchViewController.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet private weak var tableView:UITableView!
    @IBOutlet private weak var paddingTop:NSLayoutConstraint!
    var controller: SearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNaviBarSearch(onView: self, withTitle: self.nibName)
        myNavigationBar?.leftButton.setImage(UIImage(named: "navi-back"), for: UIControlState())
        controller = SearchController(initWithTargetTable: tableView)
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

extension SearchViewController:NavigationHandle {
    func navigationBarView(_ navigationView: NavigationBarView, clickLeftMenu sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationBarView(_ navigationView: NavigationBarView, clickSearch sender: AnyObject) {
        startSearch("")
    }

    func navigationBarView(_ navigationView: NavigationBarView, searchWithText keyword: String?) {
        startSearch(keyword)
    }
    
    func startSearch(_ keyword: String?) {
        // Implement code for start searching here
        controller.fetchData()
    }
}
