//
//  APIManager.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    static func getListaLanches(completion: @escaping (([Lanche]) -> Void)) {
        //var lanches: [Lanche] = [Lanche]();
        
        Alamofire.request("http://172.16.121.75:8080/api/lanche").responseJSON { (response) in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                do {
                    let lanches = try JSONDecoder().decode([Lanche].self, from: utf8Text.data(using: .utf8)!)
                    completion(lanches)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
