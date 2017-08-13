//
//  ViewController.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import UIKit
import Alamofire

class LancheListViewController: UIViewController {
    
    @IBOutlet var containerView: LancheListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.containerView.viewModel = LancheListViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
