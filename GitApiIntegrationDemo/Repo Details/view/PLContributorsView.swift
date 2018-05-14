//
//  PLContributorsView.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

class PLContributorsView: PLListingBaseView {
    
    public var contributorsURL : String! {
        didSet {
            startFetchingContributorDetails()
        }
    }
    
    //MARK:- Base override methodes
    
    public override func startFetchingContributorDetails() {
        self.urlString = "\(contributorsURL ?? "")?\(kPerPageKey)\(kNumberOfContributersNeeded)"
        super.startFetchingContributorDetails()
    }
    
    public override func downloadCompleted(_ data: Data?) {
        if let data = data {
            do {
                let contributors = try JSONDecoder().decode(Contributors.self, from: data)
                let mappedModels = contributors.map{
                    PLContributorModel($0.login ?? "No Name", $0.contributions ?? 0)
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
