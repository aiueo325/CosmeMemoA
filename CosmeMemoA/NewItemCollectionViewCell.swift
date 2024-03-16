//
//  NewItemCollectionViewCell.swift
//  CosmeMemoA
//
//  Created by Apple Green on 2024/03/16.
//

import UIKit

class NewItemCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(brand: String, item: String, number: String, sliderValue: Float){
        brandLabel.text = brand
        itemLabel.text = item
        numberLabel.text = number
        slider.value = sliderValue
    }
    
}
