//
//  APIHelper.swift
//  KCWInterview
//
//  Created by Kerry Washington on 8/29/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class APIHelper : NSObject {
    
    static let shared = APIHelper()
    
    func fetchMenuWithCompletion(urlString: String, handler:@escaping ([PizzaModel]?, Error?) -> Void) {
 
        if let urlRequest  = URL(string: urlString) {
    
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
             do {
                 let zumePizzaData = try JSONDecoder().decode([PizzaModel].self, from: data)
                 DispatchQueue.main.async {
                    handler(zumePizzaData,nil)
                }
            } catch let jsonError {
                handler(nil,jsonError)
            }
            }.resume()
        }
    }
    
}
