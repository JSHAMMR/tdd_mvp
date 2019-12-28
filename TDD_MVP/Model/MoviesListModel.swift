//
//  MoviesListModel.swift
//  TDD_MVP
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
import UIKit

protocol MoviesListModelDelegate : AnyObject {
    func didFetchMovies(success:Bool, movies:[Movie])
}

open class MoviesListModel {
    weak var delegate: MoviesListModelDelegate?
    private let networkLayer: Network

    init(networkLayer:Network) {
        self.networkLayer = networkLayer
    }
    
   open func fetchMovies() {
        self.networkLayer.executeGETRequest(api: "/Movies", completionBlock: { (data) in
            if let moviesData = data {
                let movieParser = MovieParser()
                let movies = movieParser.parseMovies(data: moviesData)
                if let delegate = self.delegate {
                    delegate.didFetchMovies(success: true, movies: movies)
                    return
                }
            }
            
            if let delegate = self.delegate {
                delegate.didFetchMovies(success: false, movies: [])
                return
            }
        })
    }
}
