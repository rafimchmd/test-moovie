//
//  BerandaViewController.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit
import Kingfisher

class BerandaViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var presenter: BerandaPresenterProtocol?
    var allMovies: ResAllMovieStruct?
    var pages: Int = 1
    var isMovieLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getAllMovies(pages: pages)
    }
    
    func setupNavigation() {
        self.title = "Beranda"
    }
    
    func setupDelegate() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.setupBackground()
    }
    
}

extension BerandaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMovieLoaded {
            return allMovies?.results?.count ?? 0
        } else {
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.movieCell, for: indexPath)!
        if isMovieLoaded {
            cell.adultView.hideShimmer()
            cell.descriptionLabel.hideShimmer()
            cell.posterImageView.hideShimmer()
            cell.ratingView.hideShimmer()
            cell.titleLabel.hideShimmer()
            if let movies = allMovies?.results {
                cell.adultView.isHidden = movies[indexPath.row].adult
                cell.posterImageView.kf.setImage(with: URL(string: "\(URLStruct.IMAGE_BASE_URL)\(movies[indexPath.row].posterPath)"))
                cell.ratingLabel.text = "\(movies[indexPath.row].voteAverage)"
                cell.descriptionLabel.text = movies[indexPath.row].overview
                cell.titleLabel.text = movies[indexPath.row].title
            }
        } else {
            cell.adultView.loadShimmer(cornerRadius:4)
            cell.descriptionLabel.loadShimmer(cornerRadius:4)
            cell.posterImageView.loadShimmer(cornerRadius:4)
            cell.ratingView.loadShimmer(cornerRadius:4)
            cell.titleLabel.loadShimmer(cornerRadius:4)
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let movies = allMovies?.results {
            presenter?.gotoDetail(movie: movies[indexPath.row])
        }
    }
}

extension BerandaViewController: BerandaViewProtocol {
    func displayMovies(response: ResAllMovieStruct) {
        self.allMovies = response
        isMovieLoaded = true
        movieTableView.reloadData()
    }
}
