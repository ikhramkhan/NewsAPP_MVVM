//
//  CategoriesTableViewCell.swift
//  NewsAssessment
//
//  Created by Mohamed Ikhram Khan on 06/06/2022.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        accessoryType = selected ? .checkmark : .none
    }
    
    
    class func reuseIdentifier() -> String
    {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    func setUpCategory(categoryVal:CategoriesResponse, row:Int, section:Int)
    {
        if (section == 0) {
            self.textLabel?.text = categoryVal.category?[row].capitalized
        } else {
            self.textLabel?.text = categoryVal.country?[row].name?.capitalized
        }
        
        
    }
    
    
}
