//
//  UIView+Extension.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/10/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

protocol Nameable {
    static var name: String { get }
}

extension Nameable {
    static var name: String {
        return String(describing: self)
    }
}

extension UIView: Nameable { }


extension UIImageView {
    func asyncImageLoad(url: URL, placeholder: UIImage?) {
        image = placeholder
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = img
                }
            }
        }
    }
}
