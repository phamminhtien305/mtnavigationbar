//
//  NavigationBarView.swift
//  BaseProject
//
//  Created by  on 8/9/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

@objc protocol NavigationHandle {
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickLeftMenu sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickRightMenu sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickOtherMenu sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickDropdown sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickSearch sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, searchWithText keyword: String?)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickDelete sender: AnyObject)
    @objc optional func navigationBarView(_ navigationView: NavigationBarView, clickDeleteAll sender: AnyObject)
}

public enum NavigationType:Int {
    case standard
    case dropdown
    case naviSearchButton
    case naviSearchBar
    case libraryBooks
}

class NavigationBarView: UIView {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var otherButton: UIButton!
    
    @IBOutlet weak var arrowGenreImage: UIImageView!
    @IBOutlet weak var droplistButton: UIButton!
    @IBOutlet weak var drowdownView: UIView! {
        didSet{
            drowdownView?.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var otherView: UIView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var searchBarView: UIView!
    
    @IBOutlet weak var suggestSearchView: UIView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var delegate : NavigationHandle?
    
    class func instanceFromNib(_ frame: CGRect) -> NavigationBarView {
        let myNavigationBar = UINib(nibName: "NavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        myNavigationBar.frame = frame
        return myNavigationBar
    }
    
    class func instanceFromSearchNib(_ frame: CGRect) -> NavigationBarView {
        let myNavigationBar = UINib(nibName: "SearchNavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        myNavigationBar.frame = frame
        return myNavigationBar
    }

    class func instanceFromLibraryBooksNib(_ frame: CGRect) -> NavigationBarView {
        let myNavigationBar = UINib(nibName: "LibraryNavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        myNavigationBar.frame = frame
        return myNavigationBar
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtSearch?.delegate = self
    }
    
    func updateTitle(_ title:String?) {
        if let _title = title {
            lbTitle?.text = _title
        }
    }
    
    func hiddenOrtherButton(_ hidden:Bool) {
        self.otherButton?.isHidden = hidden
    }
    
    func setupRightButton(_ img:String, hidden:Bool) {
        self.rightButton?.isHidden = hidden
        self.rightButton?.setImage(UIImage(named: img), for: UIControlState())
    }
    
    func showRightButton() {
        self.rightButton?.isHidden = false
    }

    var navigationBarType: NavigationType = .standard {
        didSet{
            switch navigationBarType {
            case .standard:
                lbTitle?.isHidden = false
                searchBarView?.isHidden = true
                break
            case .naviSearchBar:
                lbTitle?.isHidden = true
                searchBarView?.isHidden = false
                break
            case .naviSearchButton:
                lbTitle?.isHidden = false
                searchBarView?.isHidden = true
                break
            case .libraryBooks:
                lbTitle?.isHidden = false
                
            default:
                lbTitle?.isHidden = true
                searchBarView?.isHidden = true
                break
            }
        }
    }
    
    @IBAction func clickLeftButton(_ sender: AnyObject) {
        if (delegate?.navigationBarView(_:clickLeftMenu:)) != nil {
            delegate?.navigationBarView?(self, clickLeftMenu: sender)
        }
    }
    
    @IBAction func otherButtonClick(_ sender: AnyObject) {
        if delegate?.navigationBarView(_:clickOtherMenu:) != nil {
            delegate?.navigationBarView!(self, clickOtherMenu: sender)
        }
    }
    
    @IBAction func rightButtonClick(_ sender: AnyObject) {
        if delegate?.navigationBarView(_:clickRightMenu:) != nil {
            let btn = sender as! UIButton
            btn.isSelected = !btn.isSelected
            delegate?.navigationBarView!(self, clickRightMenu: sender)
        }
    }
}

//MARK: - Handle with search Navigatiobar
extension NavigationBarView {
    @IBAction func clickSearch(_ sender: AnyObject) {
        switch navigationBarType {
        case .naviSearchButton:
            if delegate?.navigationBarView(_:clickSearch:) != nil {
                delegate?.navigationBarView!(self, clickSearch: sender)
            }
            break
        default:
            if delegate?.navigationBarView(_:searchWithText:) != nil {
                if (txtSearch?.text?.count)! > 0 {
                    delegate?.navigationBarView!(self, searchWithText: txtSearch.text)
                }
            }
        }
        
        self.endEditing(false)
    }
}

//MARK: - Handle with search Library
extension NavigationBarView {
    @IBAction func clickDelete(_ sender: AnyObject) {
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
        if delegate?.navigationBarView(_:clickDelete:) != nil {
            delegate?.navigationBarView!(self, clickDelete: sender)
        }
    }
    
    @IBAction func clickDeleteAll(_ sender: AnyObject) {
        if delegate?.navigationBarView(_:clickDeleteAll:) != nil {
            delegate?.navigationBarView!(self, clickDeleteAll: sender)
        }
    }
}

//MARK: - UITextField Delegate
extension NavigationBarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if delegate?.navigationBarView(_:searchWithText:) != nil {
            if (txtSearch?.text?.count)! > 0 {
                delegate?.navigationBarView!(self, searchWithText: txtSearch?.text)
            }
        }
        return true
    }
}
