//
//  PLIssuesListView.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

class PLIssuesListView: PLListingBaseView {
    
    public var issuesURL : String! {
        didSet {
            startFetchingContributorDetails()
        }
    }
    
    //MARK:- Base override methodes
    
    public override func startFetchingContributorDetails() {
        let modifiedBaseUrl = issuesURL.components(separatedBy: "{")
        self.urlString = "\(modifiedBaseUrl.first ?? "")?\(kPerPageKey)\(kNumberOfContributersNeeded)"
        super.startFetchingContributorDetails()
    }
    
    public override func downloadCompleted(_ data: Data?) {
        if let data = data {
            do {
                let issues = try JSONDecoder().decode(Issues.self, from: data)
                let mappedModels = issues.map {
                    PLIssuesModel($0.title ?? "Failed to fetch")
                }
                
                listingData = mappedModels
                
                DispatchQueue.main.async {
                    self.listingTable.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
    
}
