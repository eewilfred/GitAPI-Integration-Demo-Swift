//
//  PLContributorModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

class PLContributorModel: PLBaseListingModel {
    var contributions : Int? {
        set {
           super.details = "\(newValue ?? 0)"
        }
        
        get {
            return Int(details ?? "0")
        }
    }
    
    init(_ name : String , _ contributions : Int) {
        super.init()
        self.name = name
        self.contributions = contributions
    }
}
