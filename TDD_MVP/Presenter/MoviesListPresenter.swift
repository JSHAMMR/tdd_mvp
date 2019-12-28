//
//  MoviesListPresenter.swift
//  TDD_MVP
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

protocol MoviesListPresenterDelegate : AnyObject {
    func didFetchMovies(success:Bool)
}

public class MoviesListPresenter: NSObject {

    weak var delegate: MoviesListPresenterDelegate?
    private let moviesListModel: MoviesListModel
    private var movies: [Movie] = []

    init(moviesListModel:MoviesListModel) {
        self.moviesListModel = moviesListModel
        super.init()
        self.moviesListModel.delegate = self
    }
    
    public func fetchMovies () {
        self.moviesListModel.fetchMovies()
    }
    
    public func moviesCount() -> Int {
        return self.movies.count
    }
    
    func movieName(index:Int) -> String {
        let movie = self.movies[index]
        if let movieName = movie.name {
            return movieName
        }
        
        return ""
    }
    
    func movieRatting(index:Int) -> String {
        let movie = self.movies[index]
        if let movieRatting = movie.rating {
            return movieRatting
        }
        
        return ""
    }
}

extension MoviesListPresenter : MoviesListModelDelegate {
    func didFetchMovies(success: Bool, movies: [Movie]) {
        self.movies = movies
        if let delegate = self.delegate {
            delegate.didFetchMovies(success: success)
            return
        }
    }
}
