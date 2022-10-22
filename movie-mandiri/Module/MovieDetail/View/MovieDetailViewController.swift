//
//  MovieDetailViewController.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var adultView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var trailerLabel: UILabel!
    
    var presenter: MovieDetailPresenterProtocol?
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Detail"
        let leftItem = UIBarButtonItem(image: R.image.back(), style: .plain, target: self, action: #selector(back))
        leftItem.tintColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func back() {
        presenter?.close()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.displayInfo()
    }

}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func displayTrailerUrl(response: ResTrailerStruct) {
        urlString = response.results.first?.key ?? ""
        trailerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoTrailer)))
    }
    
    func displayInfo(selectedMovie: ResMovieStruct) {
        backgroundImageView.kf.setImage(with: URL(string: "\(URLStruct.IMAGE_BASE_URL)\(selectedMovie.backdropPath)"))
        posterImageView.kf.setImage(with: URL(string: "\(URLStruct.IMAGE_BASE_URL)\(selectedMovie.posterPath)"))
        titleLabel.text = selectedMovie.title
        ratingLabel.text = "\(selectedMovie.voteAverage)"
        adultView.isHidden = selectedMovie.adult
        descriptionLabel.text = selectedMovie.overview
        presenter?.getTrailer(movieId: "\(selectedMovie.id)")
        trailerLabel.isUserInteractionEnabled = true
        presenter?.getReview(movieId: "\(selectedMovie.id)")
        
    }
    
    @objc func gotoTrailer() {
        presenter?.gotoTrailer(url: urlString)
    }
    
    func displayReview(response: ResReviewStruct) {
        let reviewtext = response.results.first?.content ?? ""
        reviewLabel.text = reviewtext
    }
}
