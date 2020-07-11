//
//  NewsInteractor.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/9/20.
//  Copyright (c) 2020 Sun and Sand Sports LLC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NewsBusinessLogic
{
    func getArticles(request: News.Articles.Request)
}

protocol NewsDataStore
{
    var article: News.Articles.ViewModel.DisplayedDocs? { get set}
}

class NewsInteractor: NewsBusinessLogic, NewsDataStore
{
    var article: News.Articles.ViewModel.DisplayedDocs?
    var presenter: NewsPresentationLogic?
    var worker: NewsWorker?
    //var name: String = ""
    
    func getArticles(request: News.Articles.Request)
    {
        worker = NewsWorker()
        worker?.fetchNewsArticles(request: request, completion: { (response) in
            switch response {
            case .success(let value):
                guard let results = value else { return }
                print(results)
                let response = News.Articles.Response(response: results, error: nil)
                self.presenter?.getArticles(response: response)
            case .failure(let error):
                print(error)
                let response = News.Articles.Response(response: nil, error: error.localizedDescription)
                self.presenter?.getArticles(response: response)
            }
        })
    }
}