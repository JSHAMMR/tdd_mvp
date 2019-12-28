//
//  MovieTableViewCell.swift
//  TDD_MVP
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    var movie:Movie! {
        didSet {
            self.nameLbl.text = movie.name
            self.ratingLbl.text = movie.rating
            self.descLbl.text = movie.desc

        }
    }

}
