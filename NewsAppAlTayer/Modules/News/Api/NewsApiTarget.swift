//
//  NewsApiTarget.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation
import Alamofire

enum NewsApiTarget: URLRequestBuilder {
    
    //https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=5763846de30d489aa867f0711e2b031c&q=singapore&page=0
    
    case getArticles(request : News.Articles.Request)
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .getArticles(_):
            return "articlesearch.json"
        }
    }

    internal var mainURL: URL {
        switch self {
        case .getArticles(_):
            return URL(string: Environment().baseUrl)!
        }
    }


    // MARK: - Query Parameters
        internal var queryParameters: [URLQueryItem]? {
            switch self {
            case .getArticles(let request):
                return [URLQueryItem(name: "api-key", value: request.apikey),
                        URLQueryItem(name: "q", value: request.query),
                        URLQueryItem(name: "page", value: String(request.page))]
            }
        }
        

        // MARK: - Parameters
        internal var parameters: Parameters? {
            switch self {
            case .getArticles(_):
                return nil
            }
        }
        
        // MARK: - Headers
        
        var headers: HTTPHeaders {
            var header = HTTPHeaders()
            switch self {
            case .getArticles(_):
                header["Content-type"] = "application/json"
            }
            return header
        }
        
        // MARK: - Methods
        internal var method: HTTPMethod {
            switch self {
            case .getArticles(_):
                return .get
            }
        }
    
    
}
