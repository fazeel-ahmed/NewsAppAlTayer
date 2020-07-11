//
//  Configuration.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation

public struct Environment {
    
    
}

extension Environment {

    var baseUrl:String {
        return "https://api.nytimes.com/svc/search/v2/"
    }
    
    var apiKey:String {
        return "BOHyaWvGJqIN258uJVjbrF6u7V4Hf9Vo"
    }
    
    var baseImageURL:String {
        return "https://static01.nyt.com/"
    }

}
