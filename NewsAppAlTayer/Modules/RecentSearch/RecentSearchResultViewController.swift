//
//  RecentSearchResultViewController.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import UIKit

class RecentSearchResultViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var resultsTableView: UITableView!
    
    //MARK:- Delegate
    weak var delegate: RecentSearchResultProtocol?
    
    //MARK:- View Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func reloadRecentSearches() {
        resultsTableView.reloadData()
    }
}

extension RecentSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecentSearchDataStore.instance.recentQueriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = RecentSearchDataStore.instance.searchQueryAt(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.recentSearchQuerySelected(query: RecentSearchDataStore.instance.searchQueryAt(index: indexPath.row))
    }
    
}

