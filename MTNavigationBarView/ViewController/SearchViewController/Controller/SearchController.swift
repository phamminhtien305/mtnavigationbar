//
//  SearchController.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class SearchController: BaseTableController {
    override func fetchData() {
        self._targetTableView?.alpha = 0.0
        UIView.animate(withDuration: 0.25, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self._targetTableView?.alpha = 1.0
        }) { (finish) in
            self.updateWithListItem([Quotations().getListQuotations()] as [AnyObject])
        }
    }
    
    override func registerNibWithTargetTableView(_ targetTableView: UITableView) {
        targetTableView.backgroundColor = ColorConfig.BACKGROUND_SEARCHLIST_COLOR
        targetTableView.register(cellType: ResultsTableViewCell.self)
    }
    
    override func getCellIdentify(withItem item: AnyObject?, returnClassName: Bool) -> String {
        return ResultsTableViewCell.nibName(returnClassName: returnClassName)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.itemAtIndexPath(indexPath) {
            UIAlertView.show(withTitle: "Toturial", message: "Would you like store this quota?", cancelButtonTitle: "Cancel", otherButtonTitles: ["OK"], tap: { (alertView, index) in
                switch (index) {
                case 0:
                    break
                case 1:
                    let libaryViewController = LibraryViewController.init(withQuota: item as? [String:String])
                    MainViewController.shared.pushViewController(libaryViewController, animated: true)
                    break
                default:
                    break
                }
            })
        }
    }
    
}
