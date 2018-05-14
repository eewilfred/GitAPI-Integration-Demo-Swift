//
//  PLListingBaseView.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//
// base class to show list of things like issues & contributions in a table view

import UIKit

public class PLListingBaseView: UIView, PLBaseNetworkProtocol, UITableViewDataSource, UITableViewDelegate {
    
    public var urlString : String?
    
    var listingTable : UITableView!
    var listingData : listingModel = listingModel()
    let kNumberOfContributersNeeded = 3
    var networkManager : PLBaseNetwork!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        listingTable = UITableView(frame: self.bounds, style: .plain)
        listingTable.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.frame.width + 35.0, height: self.frame.height))
        listingTable.delegate = self
        listingTable.dataSource = self
        listingTable.register(UITableViewCell.self, forCellReuseIdentifier: "ContributorCell")
        self.addSubview(listingTable)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func startFetchingContributorDetails() {
        if let url = urlString {
            networkManager = PLBaseNetwork(delegate: self)
            networkManager.baseURL = ""
            networkManager.makeNetworkCall(requestUrl: url, requestType: .GET,needsAuth: false)
        }
    }
    
    //MARK:- Table View Delegates
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.value1, reuseIdentifier: "ContributorCell")
        let data = listingData[indexPath.row]
        cell.textLabel?.text = data.name
        if let _ = data.details {
            cell.detailTextLabel?.text = "contributions: \(listingData[indexPath.row].details ?? "")"
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK:- download delegate
    public func downloadCompleted(_ data: Data?) {
        print("PLease override in child class")
    }
    
    public func downloadCompletedForImage(_ image: Data?) {}
}
