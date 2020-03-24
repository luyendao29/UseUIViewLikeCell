//
//  PageView0.swift
//  UseUIViewLikeCell
//
//  Created by Boss on 3/24/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

protocol PageView0Delegate: class {
    func delegateFromPageView0()
}

class PageView0: UIView {
    var delegate: PageView0Delegate?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
