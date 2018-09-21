//
//  MTTableViewPullRefresh.swift
//  BaseProject
//
//  Created by Pham Minh Tien on 11/1/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

let TEXT_COLOR:UIColor = UIColor(red: 87.0/255.0, green: 108.0/255.0, blue: 137.0/255.0, alpha: 1.0)
let FLIP_ANIMATION_DURATION:TimeInterval = 0.18


@objc protocol MTTableViewPullRefreshDelegate {
    @objc optional func egoRefreshTableHeaderDidTriggerRefresh(_ sideMenu: MTTableViewPullRefresh)
    @objc optional func egoRefreshTableHeaderDataSourceIsLoading(_ sideMenu: MTTableViewPullRefresh)-> Bool
    @objc optional func egoRefreshTableHeaderDataSourceLastUpdated(_ sideMenu: MTTableViewPullRefresh) -> Date
}

class MTTableViewPullRefresh: UIView {
    
    var delegate : MTTableViewPullRefreshDelegate?
    
    enum MTPullRefreshState: Int {
        case mtPullRefreshPulling = 0
        case mtPullRefreshNormal = 1
        case mtPullRefreshLoading = 2
    }
    
    fileprivate var _state: MTPullRefreshState?
    var _lastUpdatedLabel:UILabel?
    var _statusLabel:UILabel?
    var _arrowImage:CALayer?
    var _activityView:UIActivityIndicatorView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(frame: CGRect.zero, arrowImageName: "blueArrow.png", textColor: UIColor(red: 87.0/255.0, green: 108.0/255.0, blue: 137.0/255.0, alpha: 1.0))
    }
    
    init (frame: CGRect ,arrowImageName:String, textColor:UIColor) {
        super.init(frame: frame)
        initView(frame: frame, arrowImageName: arrowImageName, textColor: textColor)
    }
    
    func initView(frame: CGRect ,arrowImageName:String, textColor:UIColor)  {
        self.autoresizingMask = UIViewAutoresizing.flexibleWidth;
        self.backgroundColor = UIColor(red: 226.0/255.0, green: 231.0/255.0, blue: 237.0/255.0, alpha: 1.0)

        var label:UILabel = UILabel(frame:CGRect(x: 0.0, y: frame.size.height - 30.0, width: frame.size.width, height: 20.0))
        label.autoresizingMask = UIViewAutoresizing.flexibleWidth
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = textColor
        label.shadowColor = UIColor(white: 0.9, alpha: 1.0)
        label.shadowOffset = CGSize(width: 0.0, height: 1.0)
        label.backgroundColor = UIColor.clear
        
        label.textAlignment = NSTextAlignment.center
        self.addSubview(label)
        _lastUpdatedLabel=label;
        
        label = UILabel(frame: CGRect(x: 0.0, y: frame.size.height - 48.0, width: frame.size.width, height: 20.0))
        label.autoresizingMask = UIViewAutoresizing.flexibleWidth
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.textColor = textColor;
        
        label.shadowColor = UIColor(white: 0.9, alpha: 1.0)
        label.shadowOffset = CGSize(width: 0.0, height: 1.0)
        
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        self.addSubview(label)
        _statusLabel=label
        
        let layer:CALayer = CALayer()
        layer.frame = CGRect(x: 25.0, y: frame.size.height - 65.0, width: 30.0, height: 55.0)
        
        layer.contentsGravity = kCAGravityResizeAspect
        layer.contents = UIImage(named: arrowImageName)?.cgImage
        layer.contentsScale = UIScreen.main.scale
        
        self.layer.addSublayer(layer)
        _arrowImage=layer;
        let view:UIActivityIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        view.frame = CGRect(x: 25.0, y: frame.size.height - 38.0, width: 20.0, height: 20.0)
        self.addSubview(view)
        _activityView = view
        setState(MTPullRefreshState.mtPullRefreshNormal)
    }
    
    func setState(_ aState:MTPullRefreshState) {
        switch (aState) {
        case MTPullRefreshState.mtPullRefreshPulling:
            _statusLabel!.text = NSLocalizedString("Release to refresh...", comment: "Release to refresh status")
            CATransaction.begin()
            CATransaction.setAnimationDuration(FLIP_ANIMATION_DURATION)
            _arrowImage?.transform = CATransform3DMakeRotation((CGFloat(M_PI) / 180.0) * 180.0, 0.0, 0.0, 1.0)
            CATransaction.commit()
            break;
        case .mtPullRefreshNormal:
            if _state == MTPullRefreshState.mtPullRefreshPulling {
                CATransaction.begin()
                CATransaction.setAnimationDuration(FLIP_ANIMATION_DURATION)
                _arrowImage?.transform = CATransform3DIdentity
                CATransaction.commit()
            }
            
            _statusLabel?.text = NSLocalizedString("Pull down to refresh ...", comment: "Pull down to refresh status")
            _activityView?.stopAnimating()
            CATransaction.begin()
            CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
            
            _arrowImage?.isHidden = false;
            _arrowImage?.transform = CATransform3DIdentity;
            CATransaction.commit()
            
            refreshLastUpdatedDate()
            break;
        case .mtPullRefreshLoading:
            _statusLabel?.text = NSLocalizedString("Loading...",comment:"Loading Status")
            _activityView?.startAnimating()
            CATransaction.begin()
            CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
            _arrowImage?.isHidden = true;
            CATransaction.commit()
            break;
        }
        
        _state = aState;
    }
    
    func refreshLastUpdatedDate() {
        if self.delegate?.egoRefreshTableHeaderDataSourceIsLoading?(self) != nil {
            let date: Date = (self.delegate?.egoRefreshTableHeaderDataSourceLastUpdated?(self))!
            
            DateFormatter.Behavior.default
            DateFormatter.defaultFormatterBehavior = DateFormatter.Behavior.default
            
            let dateFormatter:DateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            
            _lastUpdatedLabel!.text = "Last Updated:" + dateFormatter.string(from: date)
            UserDefaults.standard.set(_lastUpdatedLabel?.text, forKey: "EGORefreshTableView_LastRefresh")
            UserDefaults.standard.synchronize()
        } else {
            _lastUpdatedLabel?.text = nil
        }
    }
    
    func egoRefreshScrollViewDidScroll(_ scrollView:UIScrollView) {
        if _state == MTPullRefreshState.mtPullRefreshLoading {
            var offset: CGFloat = max(scrollView.contentOffset.y * -1, 0)
            offset = min(offset, 60)
            scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0, 0.0, 0.0)
        }else  if scrollView.isDragging {
            var _loading = false
            _loading = (self.delegate?.egoRefreshTableHeaderDataSourceIsLoading?(self))!

            if _state == MTPullRefreshState.mtPullRefreshPulling && scrollView.contentOffset.y > -65.0 && scrollView.contentOffset.y < 0.0 && !_loading {
                self.setState(MTPullRefreshState.mtPullRefreshNormal)
            }else if _state == MTPullRefreshState.mtPullRefreshNormal && scrollView.contentOffset.y < -65.0 && !_loading {
                self.setState(MTPullRefreshState.mtPullRefreshPulling)
            }
            
            if scrollView.contentInset.top != 0 {
                scrollView.contentInset = UIEdgeInsets.zero
            }
        }
    }
    
    
    func egoRefreshScrollViewDidEndDragging(_ scrollView:UIScrollView) {
        var _loading = false
        
        _loading = (self.delegate?.egoRefreshTableHeaderDataSourceIsLoading?(self))!
        
        if scrollView.contentOffset.y <= -65.0 && !_loading {
            self.delegate?.egoRefreshTableHeaderDidTriggerRefresh?(self)
            setState(MTPullRefreshState.mtPullRefreshLoading)
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.2)
            scrollView.contentInset = UIEdgeInsetsMake(60.0, 0.0, 0.0, 0.0)
            UIView.commitAnimations()
        }
    }
    
    
    func egoRefreshScrollViewDataSourceDidFinishedLoading(_ scrollView:UIScrollView){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        UIView.commitAnimations()
        setState(MTPullRefreshState.mtPullRefreshNormal)
    }
}



