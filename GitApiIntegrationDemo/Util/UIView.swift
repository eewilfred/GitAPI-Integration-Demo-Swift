//
//  UIView.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
