//
//  MenuCell.swift
//  Hubtel Clone
//
//  Created by mac on 30/07/2022.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    static let identifier = "MenuCell"
    
    
    var itemView: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)
        
        return view
        
    }()
    
    var itemImage: UIImageView = {
        
        let img = UIImageView()
       // img.image = UIImage(systemName: "person.circle")
        return img
        
    }()
    
    var itemLabel: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(12)
        
        
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
       
        contentView.addSubview(itemView)
        itemView.addSubview(itemImage)
        itemView.addSubview(itemLabel)
        
   
    
    setupConstrains()
    
}

func setupConstrains(){
    
    itemImage.translatesAutoresizingMaskIntoConstraints = false
    itemLabel.translatesAutoresizingMaskIntoConstraints = false
    itemView.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
        
        itemView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
        itemView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
        itemView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
        itemView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        
        itemImage.heightAnchor.constraint(equalToConstant: 30),
        itemImage.widthAnchor.constraint(equalToConstant: 30),
    
    itemImage.leftAnchor.constraint(equalTo: itemView.leftAnchor, constant: 8),
    itemImage.topAnchor.constraint(equalTo: itemView.topAnchor, constant: 8),
    
    itemLabel.leftAnchor.constraint(equalTo: itemView.leftAnchor, constant: 8),
    itemLabel.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 12)
    
    ])
    
}
    
}
