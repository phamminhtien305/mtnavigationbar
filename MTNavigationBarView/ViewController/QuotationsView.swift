//
//  QuotationsView.swift
//  Books
//
//  Created by pham.minh.tien on 8/8/18.
//  Copyright © 2018 framgia. All rights reserved.
//

import UIKit

class QuotationsView: UIView {
    @IBOutlet private weak var lbDescriptionVN: UILabel!
    @IBOutlet private weak var lbDescriptionEN: UILabel!
    @IBOutlet private weak var lbAuthor: UILabel!
    
    func updateQuotationView() {
        let descriptionVN = Quotations().getQuoteDescriptionVN()
        let descriptionEN = Quotations().getQuoteDescriptionEN()
        let author = Quotations().getQuoteAuthor()
        lbDescriptionVN.text = descriptionVN
        lbDescriptionEN.text = descriptionEN
        lbAuthor.text = author
    }
}
