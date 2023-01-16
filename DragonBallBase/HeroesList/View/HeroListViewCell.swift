//
//  HeroListViewCell.swift
//  DragonBallBase
//
//  Created by Markel Juaristi on 16/1/23.
//

import Foundation
import UIKit

class HeroListViewCell : UITableViewCell {
    
    let nameLabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false /* muy importante siempre a false!!!*/
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
            
        
        ])
    }
    func configure(_ model: HeroModel) {
        self.nameLabel.text = model.name
    }

}
