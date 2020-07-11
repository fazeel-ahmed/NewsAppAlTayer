//
//  URLRequestBuilder.swift
//  OV_SSS_iOS
//
//  Created by Fazeel Ahmed on 1/23/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {
    
    var mainURL: URL { get }
    
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var headers: HTTPHeaders { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var queryParameters : [URLQueryItem]? { get}
}


extension URLRequestBuilder {
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL  {
        return URL(string: Environment().baseUrl)!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var queryURL : URL {
        var urlComp = URLComponents(string: self.requestURL.absoluteString)
        urlComp?.queryItems = queryParameters
        guard let url = urlComp?.url else {return URL(string: Environment().baseUrl)!}
        print(url.absoluteString)
        return url
    }


    var urlRequest: URLRequest {
        var request = URLRequest(url: queryURL)
        request.httpMethod = method.rawValue
        request.headers = headers
        return request
    }

    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: queryURL)
        request.httpMethod = method.rawValue
        request.headers = headers
        
        // Parameters
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [.fragmentsAllowed])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return try encoding.encode(request, with: parameters)
        
    }
}
