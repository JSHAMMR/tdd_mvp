//
//  Network.swift
//  TDD_MVP
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

open class Network: NSObject {
    open func executeGETRequest(api:String, completionBlock:@escaping (Data?) -> Void)  {
        let environment = ProcessInfo.processInfo.environment
        var baseUrl:String = ""

        if let _ = environment["isUITest"] {
            // Running in a UI test
            baseUrl = ProcessInfo.processInfo.environment["BASEURL"]!
        } else {
            baseUrl = "https://api.example.com"
        }

        guard let gitUrl = URL(string: baseUrl + api) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let returnData = String(data: data, encoding: .utf8) {
                    print(returnData)
                } else {
                    print("empty")
                }
            }
            
            if let err = error {
                print("Err", err)
            }
            
            completionBlock(data)
        }
        dataTask.resume()
    }
}
