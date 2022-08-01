//
//  TopBannerCell.swift
//  Hubtel Clone
//
//  Created by mac on 30/07/2022.
//

import UIKit

class TopBannerCell: UICollectionViewCell {
    
    static let identifier = "TopBannerCell"
    
    var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Hubtel Balance"
        label.font = label.font.withSize(12)
        return label
        
    }()
    
    var balanceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "GHS 0.00"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
        
    }()
    
    var balanceView: UIView = {
       let view = UIView()
        
        
        return view
    }()
    
    var balanceBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.layer.cornerRadius =   button.frame.size.width / 2
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
            
            return button
        
    }()
    
    var cardsView: UIView = {
       let view = UIView()
       
        return view
    }()
    
    var cardsLabel: UILabel = {
        let label = UILabel()
        label.text = "Cards & Wallets"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
        
    }()
    
    var cardsButton: UIButton = {
        let cardbutton = UIButton()
        cardbutton.clipsToBounds = true
        cardbutton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cardbutton.layer.cornerRadius =   cardbutton.frame.size.width / 2
        cardbutton.backgroundColor = .white
        cardbutton.setImage(#imageLiteral(resourceName: "wallet"), for: .normal)
        cardbutton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        
        return cardbutton
        
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(balanceView)
        balanceView.addSubview(balanceLabel)
        balanceView.addSubview(balanceValueLabel)
        
        contentView.addSubview(balanceBtn)
        contentView.addSubview(cardsView)
        cardsView.addSubview(cardsLabel)
        cardsView.addSubview(cardsButton)
        
        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        cardsButton.translatesAutoresizingMaskIntoConstraints = false
        cardsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            balanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            balanceView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       //     balanceView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
        //    balanceView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        //    balanceView.widthAnchor.constraint(equalToConstant: 144),
            
            balanceLabel.topAnchor.constraint(equalTo: balanceView.topAnchor),
            balanceLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 8),
            balanceLabel.rightAnchor.constraint(equalTo: balanceView.rightAnchor, constant: -8),
            balanceValueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 4),
            balanceValueLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 8),
            balanceValueLabel.bottomAnchor.constraint(equalTo: balanceView.bottomAnchor),
            
            balanceBtn.leftAnchor.constraint(equalTo: balanceView.rightAnchor, constant: 8),
            balanceBtn.centerYAnchor.constraint(equalTo: balanceView.centerYAnchor),
            balanceBtn.heightAnchor.constraint(equalToConstant: 30),
            balanceBtn.widthAnchor.constraint(equalToConstant: 30),
            
            
            cardsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardsView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       //     cardsView.topAnchor.constraint(equalTo: contentView.topAnchor),
      //      cardsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        //    cardsView.widthAnchor.constraint(equalToConstant: 144),
            
            cardsButton.leadingAnchor.constraint(equalTo: cardsView.leadingAnchor),
            cardsButton.widthAnchor.constraint(equalToConstant: 30),
            cardsButton.heightAnchor.constraint(equalToConstant: 30),
            cardsButton.topAnchor.constraint(equalTo: cardsView.topAnchor),
            cardsButton.bottomAnchor.constraint(equalTo: cardsView.bottomAnchor),
            
            cardsLabel.leftAnchor.constraint(equalTo: cardsButton.rightAnchor, constant: 8),
            cardsLabel.rightAnchor.constraint(equalTo: cardsView.rightAnchor, constant: -8),
            cardsLabel.centerYAnchor.constraint(equalTo: cardsButton.centerYAnchor),
          
            
            
       /*     balanceView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            balanceView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            balanceLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 8),
            balanceLabel.topAnchor.constraint(equalTo: balanceView.topAnchor),
            balanceValueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 4),
            balanceValueLabel.rightAnchor.constraint(equalTo: balanceLabel.rightAnchor, constant: 4),
            balanceValueLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 8),
            balanceBtn.leftAnchor.constraint(equalTo: balanceView.rightAnchor, constant: 8),
            balanceBtn.centerYAnchor.constraint(equalTo: balanceView.centerYAnchor),
            balanceBtn.heightAnchor.constraint(equalToConstant: 44),
            balanceBtn.widthAnchor.constraint(equalToConstant: 44)*/
            
        
            
            
        ])
        
    }
    
}
