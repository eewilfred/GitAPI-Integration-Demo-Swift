//
//  PLRepoDetailsViewModelTest.swift
//  philipsLightingITests
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import XCTest
@testable import philipsLightingI

class PLRepoDetailsViewModelTest: XCTestCase {
    var viewModel : PLRepoListingViewModel!
    var expectation : XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetContributorFlow() {
        viewModel = PLRepoListingViewModel()
        viewModel.downloadCompleted(getMockData(for: "mockRepoSearch"))
        let nextView = viewModel.getNextView(0)
        let contributoView = nextView.viewModel.getContributorView(frame: CGRect.zero) as? PLContributorsView
        XCTAssertNotNil(contributoView)
        XCTAssert(contributoView?.contributorsURL == nextView.viewModel.repoModel.contributorsURL, "contributor View creation logic failed")
    }
    
    func testPLContributorsView() {
        let detailsView = getDetailView()
        _ = detailsView.view
        let contributoView = detailsView.contributerPlaceHolder.subviews.first as? PLContributorsView
        XCTAssertNotNil(contributoView, "Adding contributor view logic went wrong")
        
        contributoView?.downloadCompleted(self.getMockData(for: "mockContributors"))
        XCTAssert(contributoView?.listingData.count == contributoView?.kNumberOfContributersNeeded, "Download logic failed")
        XCTAssert(contributoView?.listingTable.numberOfRows(inSection: 0) == contributoView?.kNumberOfContributersNeeded, "UI logic went wrong")
    }
    
    func getMockData(for  filename : String) -> Data? {
        let aTestBundle = Bundle(for: type(of: self))
        var data : Data?
        if let aFileURL = aTestBundle.url(forResource: filename, withExtension: "json") {
            data = NSData(contentsOf: aFileURL)! as Data
        }
        
        return data
    }
    
    func getDetailView() -> PLRepoDetailsViewController {
        viewModel = PLRepoListingViewModel()
        viewModel.downloadCompleted(getMockData(for: "mockRepoSearch"))
        let nextView = viewModel.getNextView(0)
        XCTAssertNotNil(nextView)
        return nextView
    }
    
    
}
