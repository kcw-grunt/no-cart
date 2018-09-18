//
//  SelectionViewController.swift
//  KCWInterview
//
//  Created by Kerry Washington on 8/29/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class SelectionViewController: UITableViewController {
    
    var pizzaDataArray : [PizzaModel]? = [PizzaModel]()
    let localSymbol = CurrencyHelper.getSymbol()
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let fetchUrlString = "https://api.myjson.com/bins/d7wgd"

        APIHelper.shared.fetchMenuWithCompletion(urlString: fetchUrlString, handler: { (pizzas, error) in
            if error != nil && pizzas != nil {
                print(error ?? "There was a pizza error")
            } else {
                self.pizzaDataArray = nil
                self.pizzaDataArray = pizzas
                self.tableView.reloadData()
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaDataArray!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pizzaCell", for: indexPath) as! PizzaTableViewCell
        let pizza = pizzaDataArray![indexPath.row]
  
            cell.pizzaImageView.imageFromServerURL(String(describing:pizza.menuAsset.url), placeHolder: UIImage.init(named: "cellPlaceholderImage"))
            cell.pizzaTitleLabel.text = pizza.name
            cell.pizzaDescriptionLabel.text = self.toppingToString(toppings: pizza.toppings)
            cell.pizzaPriceLabel.text = String(format: "%@%.2f", localSymbol, pizza.price)
        
        if let classfications = pizza.classifications {
                if let isVegetarian = classfications["vegetarian"] {
                    if isVegetarian {
                        cell.vegView.image = UIImage.init(named: "vegetarianIcon")
                    } else {
                        cell.vegView.image = nil
                    }
                }

                if let isSpicy = classfications["spicy"] {
                    if isSpicy {
                        cell.chiliView.image = UIImage.init(named: "chiliIcon")
                    } else {
                        cell.chiliView.image = nil
                    }
                }
            }
 
        return cell
    }
    
    func toppingToString(toppings: [Topping]) -> String {
        var toppingString = ""
        for (i,t) in toppings.enumerated() {
            let ct = Int(toppings.count) - 1
            if i < ct {
                toppingString += t.name + ", "
            } else {
                toppingString += t.name
            }
        }
        return toppingString
    }

 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
