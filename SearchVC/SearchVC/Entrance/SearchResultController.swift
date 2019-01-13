//
//  SearchResultController.swift
//  SearchVC
//
//  Created by 庄园 on 2019/1/11.
//  Copyright © 2019年 庄园. All rights reserved.
//

import UIKit

class SearchResultController: UITableViewController {
    
    var searchResult:[Item]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    // MARK: tableViewDataSource
    //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResult?.count ?? 0
    }
    
    //
    // MARK: tableViewDelegate
    //
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell")!
        cell.textLabel?.text = self.searchResult?[indexPath.row].name ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier:"DetailViewController" )
        self.presentingViewController?.navigationController?.pushViewController(detailController, animated: true);
        detailController.title = self.searchResult?[indexPath.row].name
    }
    
}
