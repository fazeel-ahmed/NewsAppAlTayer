//
//  NewsListCell.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
       @IBOutlet weak var headlineLabel: UILabel!
       @IBOutlet weak var snippetLabel: UILabel!
       @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    
    func configureCell (model : News.Articles.ViewModel.DisplayedDocs) {
        
        headlineLabel.text = model.headline?.main
        snippetLabel.text = model.snippet
        dateLabel.text = model.pub_date
        if let url = model.multimedia?.first?.url {
            self.newsImageView.load(URL.init(string: "\(Environment().baseImageURL)\(url)"))
        } else {
            newsImageView.image = UIImage(named: "placeholder")
        }
        
    }
}
