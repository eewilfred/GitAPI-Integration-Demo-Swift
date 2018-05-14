//
//  PLRepoDetailsViewController.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//
// As part of MVVCM design VC is kept as dumb / less code as possible

import UIKit

class PLRepoDetailsViewController: UIViewController {
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoDescription: UITextView!
    
    @IBOutlet weak var issueViewPlaceHolder: UIView!
    
    @IBOutlet weak var contributerPlaceHolder: UIView!
    
    var viewModel : PLRepoDetailsViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel = PLRepoDetailsViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoName.text = viewModel.repoModel.fullName
        repoDescription.text = viewModel.repoModel.repoDescription
        configureOtherViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- View Configure:
    
    func configureOtherViews() {
        let contributorView = viewModel.getContributorView(frame : contributerPlaceHolder.bounds)
        contributerPlaceHolder.addSubview(contributorView)
        
        let issuesView = viewModel.getIssuesView(frame : contributerPlaceHolder.bounds)
        issueViewPlaceHolder.addSubview(issuesView)
    }
}
