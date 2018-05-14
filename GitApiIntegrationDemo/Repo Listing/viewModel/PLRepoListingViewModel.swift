//
//  PLRepoListingViewModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

let kItemsPerPage = 100
let kDefaultLanguage = "Swift"

protocol PLRepoListingViewModelProtocol : class {
    func needsToReload()
    func presentAnAlert(_ alert : UIAlertController)
}

class PLRepoListingViewModel: NSObject, PLBaseNetworkProtocol {
    weak var delegate : PLRepoListingViewModelProtocol?
    
    internal var network : PLBaseNetwork = PLBaseNetwork()
    internal var reposInfoModel : [PLListingModel] = [PLListingModel]()
    internal var pageNumber = 1
    internal var lazyNextLoadIndex = 40
    private var lastFetchedQuery : String?
    var intialDownloadView: UIActivityIndicatorView?
    
    override init() {
        super.init()
        network.delegate = self
    }
    
    public func getNumberOfItemsToDisplay() -> Int{
        return reposInfoModel.count
    }
    
    public func configureCellAtIndex(_ cell : PLRepoListingTableViewCell, indexPath : IndexPath) {
        let dataForCell = reposInfoModel[indexPath.row]
        cell.repoName?.text = dataForCell.name
        cell.repoDescription?.text = dataForCell.repoDescription
        cell.starCount?.text = "\(dataForCell.stargazersCount)"
        
        if reposInfoModel.count - indexPath.row == lazyNextLoadIndex { //if less than 100 adjust this
            fetchReposForQuery(lastFetchedQuery ?? kDefaultLanguage)
        }
    }
    
    public func modelAtIndex(_ index : Int) -> PLListingModel { //can add protection if used by third person
        return reposInfoModel[index]
    }
    
    public func fetchReposForQuery(_ query : String) {
        if let lastQuery = lastFetchedQuery , lastQuery == query {
            pageNumber += 1
        } else {
            pageNumber = 1
            reposInfoModel.removeAll()
            delegate?.needsToReload()
        }
        
        lastFetchedQuery = query
        let searchQuery = "search/repositories?\(kPerPageKey)\(kItemsPerPage)&page=\(pageNumber)&q=language:\(query)&sort=stars&order=desc"
        print("Search String = \(searchQuery)")
        network.makeNetworkCall(requestUrl: searchQuery)
    }
    
    func downloadCompleted(_ data: Data?) {
        if let data = data {
                if let items = try? JSONDecoder().decode(Stock.self, from: data).items, let parsedData = items {
                    reposInfoModel += parsedData.map{
                        return PLListingModel($0)
                    }
                    removeIntialDownloadScreen()
                    delegate?.needsToReload()
                } else {
                    self.downloadFailed()
                }
        } else {
            self.downloadFailed()
        }
    }
    
    func downloadCompletedForImage(_ image: Data?) {}
    
    func downloadFailed() {
        removeIntialDownloadScreen()
        
        let aAlertController = UIAlertController.init(title: "No Repo Found", message: "Please search some thing else...", preferredStyle: .alert)
        aAlertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default))
        delegate?.presentAnAlert(aAlertController)
    }
    
    func getNextView(_ index : Int) -> PLRepoDetailsViewController {
       let detailsPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PLRepoDetailsViewController") as! PLRepoDetailsViewController
        detailsPage.viewModel.repoModel = reposInfoModel[index]
        return detailsPage
    }
    
    func getIntialDownloadScreen(For frame: CGRect ) -> UIView {
        intialDownloadView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        intialDownloadView?.frame = frame
        intialDownloadView?.startAnimating()
        return intialDownloadView!
    }
    
    func removeIntialDownloadScreen() {
        if let intialDownloadView = self.intialDownloadView {
            DispatchQueue.main.async {
                intialDownloadView.stopAnimating()
                intialDownloadView.removeFromSuperview()
                self.intialDownloadView = nil
            }
        }
    }
}
