//
//  GenreViewController.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit

class GenreViewController: UIViewController {
    
    @IBOutlet weak var genreTableView: UITableView!
    var presenter: GenrePresenterProtocol?
    var genres: [GenreStruct]?
    var movieResponse: ResAllMovieStruct?
    var page: Int = 1
    var categoryId: Int?
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getAllGenre()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupNavigation() {
        self.title = "Genre"
    }
    
    private func setupDelegate() {
        genreTableView.setupBackground()
        genreTableView.delegate = self
        genreTableView.dataSource = self
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieResponse?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.genreMovieCell, for: indexPath)!
        if let movies = movieResponse?.results {
            cell.adultView.isHidden = movies[indexPath.row].adult
            cell.posterImageView.kf.setImage(with: URL(string: "\(URLStruct.IMAGE_BASE_URL)\(movies[indexPath.row].posterPath)"))
            cell.ratingLabel.text = "\(movies[indexPath.row].voteAverage)"
            cell.descriptionLabel.text = movies[indexPath.row].overview
            cell.titleLabel.text = movies[indexPath.row].title
        } else {
            print("not found")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = R.nib.genreFilterView(owner: nil)!
        view.filterCollectionView.register(UINib(resource: R.nib.genreFilterCollectionViewCell), forCellWithReuseIdentifier: "filterCell")
        view.filterCollectionView.delegate = self
        view.filterCollectionView.dataSource = self
        let defaulIndexPath = IndexPath(row: selectedIndex, section: 0)
        view.filterCollectionView.selectItem(at: defaulIndexPath, animated: true, scrollPosition: .top)
        categoryId = defaulIndexPath.row
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension GenreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! GenreFilterCollectionViewCell
        cell.genreNameLabel.text = self.genres?[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategoryId = self.genres?[indexPath.row].id
        let category = selectedCategoryId ?? 1
        selectedIndex = indexPath.row
        presenter?.getMovieByGenre(categoryId: "\(category)", page: "\(page)")
    }
}

extension GenreViewController: GenreViewProtocol {
    func displayGenre(response: ResGenreStruct) {
        self.genres = response.genres
        categoryId = self.genres?.first?.id
        let category = categoryId ?? 1
        presenter?.getMovieByGenre(categoryId: "\(category)", page: "\(page)")
        self.genreTableView.reloadData()
    }
    
    func displayMovieList(response: ResAllMovieStruct) {
        self.movieResponse = response
        self.genreTableView.reloadData()
    }
}
