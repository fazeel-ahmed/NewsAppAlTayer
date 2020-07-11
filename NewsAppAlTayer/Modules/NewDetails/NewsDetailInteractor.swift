//
//  NewsDetailInteractor.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright (c) 2020 Sun and Sand Sports LLC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NewsDetailBusinessLogic
{
    func getArticle() -> News.Articles.ViewModel.DisplayedDocs
}

protocol NewsDetailDataStore
{
    var article: News.Articles.ViewModel.DisplayedDocs? { get set}
}

class NewsDetailInteractor: NewsDetailBusinessLogic, NewsDetailDataStore
{
    var article: News.Articles.ViewModel.DisplayedDocs?
    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func getArticle() -> News.Articles.ViewModel.DisplayedDocs
    {
        if let article = self.article {
            return article
        }
        return News.Articles.ViewModel.DisplayedDocs()
    }
}
