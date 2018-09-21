//
//  ResultsTableViewCell.swift
//  MTNavigationBarView
//
//  Created by pham.minh.tien on 9/21/18.
//  Copyright © 2018 pham.minh.tien. All rights reserved.
//

import UIKit

class ResultsTableViewCell: BaseTableViewCell {
    @IBOutlet private var lbDescriptionEN: UILabel!
    @IBOutlet private var lbDescriptionVN: UILabel!
    @IBOutlet private var lbAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
    override func configCellWithData(_ data: AnyObject?) {
        if let item = data as? [String:String] {
            lbDescriptionEN.text = item["description_en"]
            lbDescriptionVN.text = item["description_vn"]
            lbAuthor.text = item["author"]
        }
    }
}
