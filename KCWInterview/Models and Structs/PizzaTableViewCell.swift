//
//  PizzaTableViewCell.swift
//  KCWInterview
//
//  Created by Kerry Washington on 8/29/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

class PizzaTableViewCell: UITableViewCell {
 
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var pizzaTitleLabel: UILabel!
    @IBOutlet weak var pizzaDescriptionLabel: UILabel!
    @IBOutlet weak var pizzaPriceLabel: UILabel!
    @IBOutlet weak var orderButton: OrderButton!
    @IBOutlet weak var vegView: UIImageView!
    @IBOutlet weak var chiliView: UIImageView!
    
    var specialtyType : String = ""
    var qty : Int = 0
    var total : Float = 0.00
    

    
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
