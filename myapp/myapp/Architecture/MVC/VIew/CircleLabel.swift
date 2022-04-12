//
//  CircleLabel.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 12/04/22.
//

import UIKit

class CircleLabel: UILabel {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect){
        self.clipsToBounds = true
        super.draw(rect)
    }
}
