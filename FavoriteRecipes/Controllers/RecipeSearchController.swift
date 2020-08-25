//
//  MealSearchController.swift
//  FavoriteRecipes
//
//  Created by Tyler Schwartzman on 8/4/20.
//  Copyright © 2020 Tyler_Dev. All rights reserved.
//

import UIKit
import Alamofire

class RecipeSearchController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
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
        tableView.reloadData()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            APIService.share.fetchMeals(searchText: searchText) { (meals) in
                self.meals = meals
                self.tableView.reloadData()
            }
        })
    }
    
    fileprivate let cellId = "cellId"
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: "MealCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailsVC = RecipeDetailsController()
        let meal = self.meals[indexPath.row]
        recipeDetailsVC.meal = meal
        
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter a Search Term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MealCell
        let meal = self.meals[indexPath.row]
        cell.meal = meal
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == true ? 250 : 0
    }
    
    var mealSearchView = Bundle.main.loadNibNamed("MealSearchingView", owner: self, options: nil)?.first as? UIView
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return mealSearchView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.meals.isEmpty && searchController.searchBar.text?.isEmpty == false ? 200 : 0
    }
}

