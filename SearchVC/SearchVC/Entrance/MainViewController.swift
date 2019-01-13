//
//  ViewController.swift
//  SearchVC
//
//  Created by 庄园 on 2019/1/11.
//  Copyright © 2019年 庄园. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate {
    var searchController:UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let resultController = self.storyboard!.instantiateViewController(withIdentifier:"SearchResultNavigationController" )
        self.searchController = UISearchController.init(searchResultsController: resultController)
        self.tableView.tableHeaderView = self.searchController?.searchBar
        self.searchController?.searchBar.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        self.searchController?.searchBar.delegate = self
        self.searchController?.searchResultsUpdater = self
        self.definesPresentationContext = true;

    }
    
    //
    // MARK: searchResultsUpdating
    //
    
    func updateSearchResults(for searchController: UISearchController) {
        let navigationController:UINavigationController = searchController.searchResultsController as! UINavigationController
        let searchResultController:SearchResultController? = navigationController.viewControllers[0] as? SearchResultController ?? nil
        let searchBar = searchController.searchBar
        if searchResultController != nil {
            searchResultController?.searchResult = Item.findItemNameContains(string: searchBar.text ?? "")
        }
    }
    
    //
    // MARK: tableViewDataSource
    //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Item.allItems().count
    }
    
    //
    // MARK: tableViewDelegate
    //
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell")!
        cell.textLabel?.text = Item.allItems()[indexPath.row].name ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier:"DetailViewController" )
        self.navigationController?.pushViewController(detailController, animated: true);
        detailController.title = Item.allItems()[indexPath.row].name
    }
    
}

