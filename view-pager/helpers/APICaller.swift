//
//  APICaller.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation

class APICaller {
    static let caller = APICaller()
    
    func callWithResult(
        urlPath : String,
        methodName: String,
        onComplete: @escaping (Data?, URLResponse?, Error?) -> Void) {
            if let url = URL(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            var request = URLRequest(url: url)
            request.httpMethod = methodName
            let session = URLSession.shared
            
            session.dataTask(with: request, completionHandler: onComplete).resume()
        }
    }
}
