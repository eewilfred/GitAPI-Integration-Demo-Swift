//
//  ViewController.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//  Git Listing view with Lazy loading in place
//  AUTH is done using key generated by my account.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var listingTable: UITableView!
    
    @IBOutlet weak var searchBar: UITextField!
    
    let kCellId = "RepoListingCellID"
    let viewModel = PLRepoListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(viewModel.getIntialDownloadScreen(For: self.view.frame))
        viewModel.delegate = self
        searchBar.text = kDefaultLanguage
        viewModel.fetchReposForQuery(kDefaultLanguage) //to start populating
        
        let nib = UINib(nibName: "PLRepoListingTableViewCell", bundle: Bundle.main)
        listingTable.register(nib, forCellReuseIdentifier: kCellId)
        listingTable.tableFooterView = UIView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.addSubview(viewModel.getIntialDownloadScreen(For: self.view.frame))
        viewModel.fetchReposForQuery(textField.text ?? "swift")
        textField.resignFirstResponder()
        return true
    }
}
    
extension ViewController : PLRepoListingViewModelProtocol {
    func needsToReload() {
        DispatchQueue.main.async {
            self.listingTable.reloadData()
        }
    }
    
    func presentAnAlert(_ alert : UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource { //to handle Table View ONLY

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfItemsToDisplay()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! PLRepoListingTableViewCell
        viewModel.configureCellAtIndex(cell, indexPath: indexPath)
        return cell
    }
    
    //if we dont use this table view will gitter on getting more data
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PLRepoListingTableViewCell.estimateCellHeightHightForModel(viewModel.modelAtIndex(indexPath.row), for: listingTable.frame.width)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return PLRepoListingTableViewCell.estimateCellHeightHightForModel(viewModel.modelAtIndex(indexPath.row), for: listingTable.frame.width)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController!.pushViewController(viewModel.getNextView(indexPath.row), animated: true)
    }
}
