//
//  ListView.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import UIKit

protocol LancheListViewDelegate: class {
    func updateTableView()
}

class LancheListView: UIView {
    var viewModel: LancheListViewModel? {
        didSet {
            self.tableview.delegate = viewModel
            self.tableview.dataSource = viewModel
            tableview.tableFooterView = UIView()
            
            viewModel?.viewDelegate = self
            
            viewModel?.updateLanches()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableview: UITableView!
}

extension LancheListView : LancheListViewDelegate {
    
    func updateTableView() {
        tableview.reloadData()
    }
}

