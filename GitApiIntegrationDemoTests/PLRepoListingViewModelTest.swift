//
//  PLRepoListingViewModelTest.swift
//  philipsLightingITests
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import XCTest
@testable import philipsLightingI

class PLRepoListingViewModelTest: XCTestCase, PLRepoListingViewModelProtocol {
    
    var viewModel : PLRepoListingViewModel!
    var expectation : XCTestExpectation?
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataDownLoadFunction() {
        viewModel = PLRepoListingViewModel()
        viewModel.downloadCompleted(getMockData())
        XCTAssert(viewModel.getNumberOfItemsToDisplay() == 10, "After passing proper 10 items we aint get 10")
        XCTAssert(viewModel.modelAtIndex(0).repoDescription == "Elegant HTTP Networking in Swift", "Data parsing went wrong was expecting some thign else")
    }
    
    func testDownloadSuccess() {
        viewModel = PLRepoListingViewModel()
        viewModel.delegate = self
        expectation = self.expectation(description: "Download Success")
        DispatchQueue.global(qos: .background).async {
            self.viewModel.downloadCompleted(self.getMockData())
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDownloadFailed() {
        viewModel = PLRepoListingViewModel()
        viewModel.delegate = self
        expectation = self.expectation(description: "DownloadFailed")
        DispatchQueue.global(qos: .background).async {
            self.viewModel.downloadFailed()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testViewNavigation() {
        viewModel = PLRepoListingViewModel()
        viewModel.downloadCompleted(getMockData())
        let model = viewModel.modelAtIndex(0)
        let nextView = viewModel.getNextView(0)
        
        XCTAssert(nextView.viewModel.repoModel.name == model.name,"Next view creation logic gone wrong")
    }
    
    func needsToReload() {
        XCTAssertNil(viewModel.intialDownloadView, "intialDownload view has to be nil after successful download")
        expectation?.fulfill()
    }
    
    func presentAnAlert(_ alert: UIAlertController) {
        expectation?.fulfill()
    }

    
    func getMockData() -> Data? {
        let aTestBundle = Bundle(for: type(of: self))
        var data : Data?
        if let aFileURL = aTestBundle.url(forResource: "mockRepoSearch", withExtension: "json") {
            data = NSData(contentsOf: aFileURL)! as Data
        }
        
        return data
    }
    
}
