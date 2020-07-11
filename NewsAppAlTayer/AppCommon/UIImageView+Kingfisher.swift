//
//  UIImageView+Kingfisher.swift
//  OV_SSS_iOS
//
//  Created by Fazeel Ahmed on 3/3/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func asyncImageLoad(url: URL?, placeholder: String = defaultPlaceholder) {
        image = UIImage(named: placeholder)
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let urls = url else {
                return
            }
            
            if let data = try? Data(contentsOf: urls), let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = img
                }
            }
        }
    }
    
    // base load dfunc
     func load(_ url: URL?,
                      placeholder: String = defaultPlaceholder,
                      errorPlaceholder: String = defaultErrorPlaceholder,
                      options: KingfisherOptionsInfo = defaultOptions) {
        
        // load place holder
        let p = UIImage(named: placeholder)
        
       
        // load image now
        self.kf.setImage(with: url, placeholder: p, options: options, progressBlock: nil) { result in
            // `result` is either a `.success(RetrieveImageResult)` or a `.failure(KingfisherError)`
            switch result {
            case .success( _): break
                // The image was set to image view:
                //print(value.image)

                // From where the image was retrieved:
                // - .none - Just downloaded.
                // - .memory - Got from memory cache.
                // - .disk - Got from disk cache.
                //print(value.cacheType)

                // The source object which contains information like `url`.
                //print(value.source)

            case .failure(let error):
                
                print(error) // The error happens
            }
        }
    }
    
    // animateLoad func
    func animateLoad(_ url: URL?,
              gif: String = defaultGif,
              errorPlaceholder: String = defaultErrorPlaceholder,
              options: KingfisherOptionsInfo = defaultOptions) {
        
        guard let path = Bundle.main.path(forResource: gif, ofType: "gif") else {
            fatalError("File  - \(gif).gif does not exist!")
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        self.kf.indicatorType = .image(imageData: data)
        
        // load image now
        self.kf.setImage(with: url, options: options, progressBlock: nil) { result in
            // `result` is either a `.success(RetrieveImageResult)` or a `.failure(KingfisherError)`
            switch result {
            case .success( _): break
                // The image was set to image view:
                //print(value.image)
                
                // From where the image was retrieved:
                // - .none - Just downloaded.
                // - .memory - Got from memory cache.
                // - .disk - Got from disk cache.
                //print(value.cacheType)
                
                // The source object which contains information like `url`.
                //print(value.source)
                
            case .failure(let error):
                
                print(error) // The error happens
            }
        }
    }
}

public let defaultOptions: KingfisherOptionsInfo = [
    .scaleFactor(UIScreen.main.scale),
    .transition(.none),
    .cacheOriginalImage
]

public let defaultGif = "logo_gif"

public let defaultPlaceholder = "placeholder_sqaure_150x150"

public let defaultErrorPlaceholder = "placeholder_sqaure_150x150"

public let defaultRoundRect: CGFloat = 10
