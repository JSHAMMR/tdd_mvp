//
//  MovieParser.swift
//  TDD_MVP
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

public class MovieParser: NSObject {

    func parseMovies(data:Data) -> [Movie] {
        do {
            
            return try [JSONDecoder().decode(Movie.self, from: data)]
            
        } catch let error as NSError {
            print(error)
        }
        return []
    }
    
}
