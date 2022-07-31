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
        
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
            
            return button
        
    }()
    
    var cardsView: UIView = {
       let view = UIView()
       
        return view
    }()
    
    var cardsLabel: UILabel = {
        let label = UILabel()
        label.text = "Cards & Wallets"
        
        return label
        
    }()
    
    var cardsImgView: UIImageView = {
        let cardimage = UIImageView()
        cardimage.clipsToBounds = true
        cardimage.backgroundColor = .gray
        
        return cardimage
        
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
        cardsView.addSubview(cardsImgView)
        
        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        cardsImgView.translatesAutoresizingMaskIntoConstraints = false
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
            
            cardsImgView.leadingAnchor.constraint(equalTo: cardsView.leadingAnchor),
            cardsImgView.widthAnchor.constraint(equalToConstant: 44),
            cardsImgView.heightAnchor.constraint(equalToConstant: 44),
            cardsImgView.topAnchor.constraint(equalTo: cardsView.topAnchor),
            cardsImgView.bottomAnchor.constraint(equalTo: cardsView.bottomAnchor),
            
            cardsLabel.leftAnchor.constraint(equalTo: cardsImgView.rightAnchor, constant: 8),
            cardsLabel.rightAnchor.constraint(equalTo: cardsView.rightAnchor, constant: -8),
            cardsLabel.centerYAnchor.constraint(equalTo: cardsImgView.centerYAnchor),
          
            
            
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
