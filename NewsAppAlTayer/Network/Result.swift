//
//  Result.swift
//  OV_SSS_iOS
//
//  Created by Fazeel Ahmed on 1/27/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
