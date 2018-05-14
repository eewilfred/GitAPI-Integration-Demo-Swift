//
//  PLListingModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//
// Copy model to be used only for UI. This has required field from parsed network model

import UIKit

class PLListingModel {
    public var name : String?
    public var fullName : String?
    public var repoDescription: String?
    public var issuesURL : String?
    public  var contributorsURL : String?
    public var licenseName :String?
    public var stargazersCount : Int
    
    init(_ item : Item) {
        name = item.name
        fullName = item.fullName
        repoDescription  = item.description
        issuesURL = item.issuesURL
        contributorsURL = item.contributorsURL
        licenseName = item.license?.name
        stargazersCount = item.stargazersCount ?? 0
    }
}
