//
//  ListViewModel.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import UIKit

class LancheListViewModel: NSObject {
    
    var lanches: [Lanche] = [] {
        didSet{
            viewDelegate?.updateTableView()
        }
    }
    
    weak var viewDelegate: LancheListViewDelegate?
    
    func updateLanches() {
        APIManager.getListaLanches { (lanches) in
            self.lanches = lanches
        }
    }
}
extension LancheListViewModel: UITableViewDelegate {
    
}

extension LancheListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lanches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = lanches[indexPath.row].name
        return cell
    }
    
    
}

