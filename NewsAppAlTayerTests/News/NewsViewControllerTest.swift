//
//  NewsAppAlTayerTests.swift
//  NewsAppAlTayerTests
//
//  Created by Fazeel Ahmed on 7/9/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import XCTest
@testable import NewsAppAlTayer

class NewsViewControllerTest: XCTestCase {

    var viewController: NewsViewController!
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
        viewController = Storyboard.newViewController.viewController as? NewsViewController
        window.addSubview(viewController.view)
    }

    func testShouldFetchNewsOnViewDidLoad() {
        loadNewsViewController()
        
        let newListViewControllerSpy = NewsViewControllerOutputSpy()
        viewController.interactor = newListViewControllerSpy
        
        viewController.viewDidLoad()
        
        XCTAssertNotNil(viewController.tableView, "ViewController should have loaded tableView")
        XCTAssert(newListViewControllerSpy.fetchedNews, "Should fetch data when viewDidLoad")
        
    }
    
    func testRefreshList() {
        loadNewsViewController()
        
        let viewControllerOutputSpy = NewsViewControllerOutputSpy()
        viewController.interactor = viewControllerOutputSpy
        
        viewController.refresh()
        
        XCTAssertTrue(viewControllerOutputSpy.fetchedNews)
    }
    
    func testViewShouldLoadTableView() {
        loadNewsViewController()
        
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertNotNil(viewController.tableView.dataSource)
    }
    
    func testNumberOfSectionsShouldBeOne() {
        loadNewsViewController()
        let numberOfSections = viewController.numberOfSections(in: viewController.tableView)
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRowsShouldBeNumberOfNews() {
        loadNewsViewController()
        let tableView = viewController.tableView
        
        let urlToImage = "https://homepages.cae.wisc.edu/~ece533/images/tulips.png"
        let newsCellModel = News.Articles.ViewModel.DisplayedDocs(lead_paragraph: "Unit Tester", abstract: "Unit Tester", headline: nil, snippet: "Unit Tester", pub_date: "2019-09-09T18:36:45Z", multimedia: nil, web_url: urlToImage)
        let viewModel = News.Articles.ViewModel(displayedArticles: [newsCellModel], error: nil)
        viewController.displayArticles(viewModel: viewModel)
        
        let numberOfRows = viewController.tableView(tableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func testDidSelectRowAtIndex() {
        let urlToImage = "https://homepages.cae.wisc.edu/~ece533/images/tulips.png"
        let newsCellModel = News.Articles.ViewModel.DisplayedDocs(lead_paragraph: "Unit Tester", abstract: "Unit Tester", headline: nil, snippet: "Unit Tester", pub_date: "2019-09-09T18:36:45Z", multimedia: nil, web_url: urlToImage)
        let viewModel = News.Articles.ViewModel(displayedArticles: [newsCellModel], error: nil)
        loadNewsViewController()
        
        let router = NewsListRouterProtocolSpy()
        let tableView = viewController.tableView
        viewController.router = router as? (NewsDataPassing & NewsRoutingLogic & NSObjectProtocol)
        
        viewController.displayArticles(viewModel: viewModel)
        
        let indexPath = IndexPath(row: 0, section: 1)
        viewController.tableView(tableView!, didSelectRowAt: indexPath)
        XCTAssertTrue(router.shownNewsDetails)
    }
    
    
}


final class NewsViewControllerOutputSpy: NewsBusinessLogic {
    
    var allNews: [Docs]?
    var fetchedNews = false
    
    func getArticles(request: News.Articles.Request) {
        fetchedNews = true
    }
}

final class NewsListRouterProtocolSpy: NewsRoutingLogic , NewsDataPassing {
    var dataStore: NewsDataStore?
    var shownNewsDetails = false
    
    func routeToDetails(segue: UIStoryboardSegue?) {
        shownNewsDetails = true
    }
    
}

