//
//  NewsDetailsViewControllerTests.swift
//  NewsAppAlTayerTests
//
//  Created by Fazeel Ahmed on 7/11/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import XCTest
@testable import NewsAppAlTayer

class NewsDetailsViewControllerTests: XCTestCase {

    var viewController: NewsDetailViewController!
    var window: UIWindow!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        window = UIWindow()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        window = nil
        viewController = nil
    }

    func loadNewsViewController() {
        viewController = Storyboard.newDetailsController.viewController as? NewsDetailViewController
        window.addSubview(viewController.view)
    }

    func testShouldDiplayCellInOrder() {
        loadNewsViewController()
        let urlToImage = "https://homepages.cae.wisc.edu/~ece533/images/tulips.png"
        let newsDetailsModel = News.Articles.ViewModel.DisplayedDocs(lead_paragraph: "Unit Tester", abstract: "Unit Tester", headline: nil, snippet: "Unit Tester", pub_date: "2019-09-09T18:36:45Z", multimedia: nil, web_url: urlToImage)
       
        viewController.setUpUI(model : newsDetailsModel)
        
        XCTAssertNotNil(viewController.headlineLabel.text)
        XCTAssertNotNil(viewController.dateLabel.text)
        XCTAssertNotNil(viewController.snippetLabel.text)
        XCTAssertNotNil(viewController.paragraphLabel.text)
        XCTAssertEqual(viewController.dateLabel.text, "Sep 09, 2019 21:36", "News details should show the date in this date format MMM dd, yyyy HH:mm")
    }
}
