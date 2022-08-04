//
//  PromoCell.swift
//  Hubtel Clone
//
//  Created by mac on 31/07/2022.
//

import UIKit

class PromoCell: UICollectionViewCell {
    
    static let identifier = "PromoCell"
    
    var itemView: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)
        
        return view
        
    }()
    
    var headerlabel: UILabel = {
        
        let headerlabel = UILabel()
        headerlabel.text = "Add money to \nyour SMS"
        headerlabel.numberOfLines = 2
        headerlabel.font = UIFont(name: "Avenir", size: 22)
        
        
        return headerlabel
        
    }()
    
    var subLabel: UILabel = {
        
        let subLabel = UILabel()
        subLabel.text = "Send with Hubtel"
        subLabel.font = UIFont(name: "Avenir", size: 12)
      
        return subLabel
        
    }()
    
    var promoImg: UIImageView = {
        
        let img = UIImageView()
        img.backgroundColor = .blue
        img.image = #imageLiteral(resourceName: "hubtel")
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        
        return img
        
    }()
    
    var arrowImg: UIImageView = {
        
        let img = UIImageView()
        img.image = UIImage(systemName: "arrow.right")
        img.clipsToBounds = true
        img.tintColor = .black
       // img.layer.cornerRadius = 8
        
        return img
        
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        contentView.addSubview(itemView)
        itemView.addSubview(promoImg)
        itemView.addSubview(headerlabel)
        itemView.addSubview(subLabel)
        
        itemView.addSubview(arrowImg)
        
        contentView.bringSubviewToFront(headerlabel)
        contentView.bringSubviewToFront(subLabel)
        contentView.bringSubviewToFront(arrowImg)
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
        promoImg.translatesAutoresizingMaskIntoConstraints = false
        headerlabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        itemView.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            itemView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            itemView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            promoImg.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            promoImg.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            promoImg.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            promoImg.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        
            headerlabel.leftAnchor.constraint(equalTo: itemView.leftAnchor, constant: 16),
            headerlabel.topAnchor.constraint(equalTo: itemView.topAnchor, constant: 32),
            subLabel.leftAnchor.constraint(equalTo: itemView.leftAnchor, constant: 16),
            subLabel.topAnchor.constraint(equalTo: headerlabel.bottomAnchor, constant: 4),
            
            arrowImg.leftAnchor.constraint(equalTo: subLabel.rightAnchor, constant: 8),
            arrowImg.centerYAnchor.constraint(equalTo: subLabel.centerYAnchor),
            arrowImg.heightAnchor.constraint(equalToConstant: 20),
            arrowImg.widthAnchor.constraint(equalToConstant: 20)
            
          
            
        ])
        
    }
    
}
