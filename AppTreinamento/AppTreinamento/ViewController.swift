//
//  ViewController.swift
//  AppTreinamento
//
//  Created by Marina Guimarães on 05/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tabela = ["a", "b", "c", "d"]
    
    @IBOutlet weak var btnAddItem: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        txtItem.delegate = self
        
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchButton(_ sender: Any) {
        addItemToTable()
    }
    
    func addItemToTable() {
        guard let text = txtItem.text else { return }
        tableView.beginUpdates()
        tabela.append(text)
        tableView.insertRows(at: [IndexPath(row: tabela.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        let alerta = UIAlertController.init(title:"Deseja mesmo deletar este item?", message:tabela[indexPath.row], preferredStyle:.alert)

        alerta.addAction(UIAlertAction.init(title:"Sim", style:.default, handler: {
            (action: UIAlertAction!) in
            self.tabela.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.endUpdates()
        }))
        
        alerta.addAction(UIAlertAction.init(title:"Não", style:.cancel, handler:nil))

        present(alerta, animated: true, completion: nil)
    }
}

extension ViewController:UITextFieldDelegate {
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        addItemToTable()
        return true
    }
    
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabela.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tabela[indexPath.row]
        return cell
    }
    
    
}

