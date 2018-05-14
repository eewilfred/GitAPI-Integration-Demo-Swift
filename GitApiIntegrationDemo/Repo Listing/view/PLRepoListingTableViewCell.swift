//
//  PLRepoListingTableViewCell.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

public class PLRepoListingTableViewCell: UITableViewCell {
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    @IBOutlet weak var starCount: UILabel!

    static func estimateCellHeightHightForModel(_ repo : PLListingModel, for width : CGFloat) -> CGFloat {
        var totalHeight : CGFloat = (repo.name?.sizeOfString(.systemFont(ofSize: 17), constrainedToWidth: width).height ?? 0.0) + 30.0 //cell gap
        totalHeight += repo.repoDescription?.sizeOfString(.systemFont(ofSize: 12), constrainedToWidth: width).height ?? 0.0 + 2.0
        
        return totalHeight
    }
    
}
