//
//  RecentSearchDataStore.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation

/// Singleton class to persist 10 recent search queries
class RecentSearchDataStore {

    static let instance = RecentSearchDataStore()
    private init() {}
    
    private let RECENT_SEARCH_KEY = "RECENT_SEARCH_KEY"
    
    private var searchResults: [String] {
        return (UserDefaults.standard.array(forKey: RECENT_SEARCH_KEY) as? [String]) ?? []
    }
    
    var hasRecentQueries: Bool {
        return searchResults.count > 0
    }
    
    var recentQueriesCount: Int {
        return searchResults.count
    }
    
    func searchQueryAt(index: Int) -> String {
        return searchResults[index]
    }
    
    ///Add new query to top of recent searches, persists first 10 and truncates rest
    /// - Parameters:
    ///   - query: query to be added
    func addToRecentSearches(query: String) {
        if var results = UserDefaults.standard.array(forKey: RECENT_SEARCH_KEY) as? [String] {
            guard !results.contains(query) else {return}
            results.insert(query, at: 0)
            UserDefaults.standard.set(Array(results.prefix(10)), forKey: RECENT_SEARCH_KEY)
        } else {
            UserDefaults.standard.set([query], forKey: RECENT_SEARCH_KEY)
        }
    }
}
