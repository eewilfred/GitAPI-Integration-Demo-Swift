//
//  String.swift
//  OmniDigitalCaseStudy
//
//  Created by Edwin Wilson on 13/04/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

public extension String {
    func sizeOfString (_ font: UIFont, constrainedToWidth width: CGFloat) -> CGSize {
        return (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                               options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                               attributes: [NSAttributedStringKey.font: font],
                                               context: nil).size
    }
}
