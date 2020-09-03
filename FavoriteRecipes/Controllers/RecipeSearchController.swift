//
//  SearchController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/27/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import Alamofire

class RecipeSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchBar()
    }
    
    //MARK:- Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        meals = []
        collectionView.reloadData()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            APIService.share.fetchMeals(searchText: searchText) { (meals) in
                self.meals = meals
                self.collectionView.reloadData()
            }
        })
    }
    
    fileprivate let cellId = "cellId"
    fileprivate let layout = RecipeSearchLayout()
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .coolGrey
        collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.collectionViewLayout = layout
    }
    
    
    
    //MARK:- UITableView
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let recipeDetailsVC = RecipeDetailsController()
    //        let meal = self.meals[indexPath.row]
    //        recipeDetailsVC.meal = meal
    //
    //        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    //    }
    //
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let label = UILabel()
    //        label.text = "Please enter a Search Term"
    //        label.textAlignment = .center
    //        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    //        return label
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return meals.count
    //    }
    //
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MealCell
    //        let meal = self.meals[indexPath.row]
    //        cell.meal = meal
    //
    //        return cell
    //    }
    //
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 132
    //    }
    //
    //    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == true ? 250 : 0
    //    }
    //
    //    var mealSearchView = Bundle.main.loadNibNamed("MealSearchingView", owner: self, options: nil)?.first as? UIView
    //    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        return mealSearchView
    //    }
    //
    //    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == false ? 200 : 0
    //    }
    
    //MARK:- UICollection View Delegate / Spacing Methods
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let nib = UINib(nibName: "MealSearchingView", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "id")
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: <#T##String#>, withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        
        return view
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MealCollectionViewCell
        let meal = self.meals[indexPath.row]
        cell.meal = meal
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recipeDetailsVC = RecipeDetailsController()
        recipeDetailsVC.meal = self.meals[indexPath.item]
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 16) / 2
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
