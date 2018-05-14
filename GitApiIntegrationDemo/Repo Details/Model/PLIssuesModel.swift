//
//  PLIssuesModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

class PLIssuesModel: PLBaseListingModel {
    var issue : String? {
        set {
            name = newValue
        }
        get {
            return name
        }
    }
    
    init(_ issue : String) {
        super.init()
        self.issue = issue
    }
}
