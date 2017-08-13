//
//  ListView.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import UIKit

class ListView: UIView {
    var viewModel: ListViewModel? {
        didSet {
            self.tableview.delegate = viewModel
            self.tableview.dataSource = viewModel
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableview: UITableView!
}
