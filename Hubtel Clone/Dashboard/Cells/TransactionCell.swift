//
//  TransactionCell.swift
//  Hubtel Clone
//
//  Created by mac on 01/08/2022.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    
    static let identifier = "TransactionCell"
    
    var compTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = label.font.withSize(12)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
        
    }()
    
    var compLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(11)
        
        return label
        
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = label.font.withSize(10)
        
        return label
        
    }()
    
    var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
        
    }()
    
    var compImg: UIImageView = {
        
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "KFC")
        img.clipsToBounds = true
      
        
        return img
        
    }()
    
    var statusImg: UIImageView = {
        
        let img = UIImageView()
        img.image = UIImage(systemName: "checkmark.circle.fill")
        img.tintColor = #colorLiteral(red: 0.2312995279, green: 0.8049846611, blue: 0.7610384395, alpha: 1)
        img.clipsToBounds = true
     
        
        return img
        
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        contentView.addSubview(compImg)
        contentView.addSubview(compLabel)
        contentView.addSubview(compTitleLabel)
        contentView.addSubview(statusImg)
        contentView.addSubview(amountLabel)
        contentView.addSubview(timeLabel)
        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
        compImg.translatesAutoresizingMaskIntoConstraints = false
        compLabel.translatesAutoresizingMaskIntoConstraints = false
        compTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusImg.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            compImg.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8),
            compImg.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            compImg.heightAnchor.constraint(equalToConstant: 44),
            compImg.widthAnchor.constraint(equalToConstant: 44),
            
            compTitleLabel.leftAnchor.constraint(equalTo: compImg.rightAnchor, constant: 8),
            compTitleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            timeLabel.leftAnchor.constraint(equalTo: compImg.rightAnchor, constant: 8),
            timeLabel.topAnchor.constraint(equalTo: compTitleLabel.bottomAnchor, constant: 8),
            
            compLabel.leftAnchor.constraint(equalTo: compImg.rightAnchor, constant: 8),
            compLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            
            statusImg.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            statusImg.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant:  -8),
            statusImg.heightAnchor.constraint(equalToConstant: 20),
            statusImg.widthAnchor.constraint(equalToConstant: 20),
            
            amountLabel.rightAnchor.constraint(equalTo: statusImg.leftAnchor, constant: -8),
            amountLabel.centerYAnchor.constraint(equalTo: statusImg.centerYAnchor)
            
    
            
        ])
        
    }
    
}
