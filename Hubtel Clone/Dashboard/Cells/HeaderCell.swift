//
//  HeaderCell.swift
//  Hubtel Clone
//
//  Created by mac on 30/07/2022.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    
    static let identifier = "HeaderCell"
    
    var headerlabel: UILabel = {
        
        let headerlabel = UILabel()
      
        headerlabel.font = headerlabel.font.withSize(22)
        return headerlabel
        
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(headerlabel)
        
        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
       
        
        headerlabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        
            headerlabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8),
            headerlabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
            
            
        ])
        
    }
    
}

