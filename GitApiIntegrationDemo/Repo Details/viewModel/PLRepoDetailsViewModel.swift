//
//  PLRepoDetailsViewModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//
// view model for details, this class provides / control all data and view layout needs

import UIKit

class PLRepoDetailsViewModel {

    public var repoModel : PLListingModel! //must be There
    
    init() {}
    
    func getContributorView(frame : CGRect) -> UIView {
        let contractorView =  PLContributorsView(frame: frame)
        contractorView.contributorsURL = repoModel.contributorsURL
        return contractorView
    }
    
    func getIssuesView(frame : CGRect) -> UIView {
        let issuesView = PLIssuesListView(frame: frame)
        issuesView.issuesURL = repoModel.issuesURL
        return issuesView
    }
}
