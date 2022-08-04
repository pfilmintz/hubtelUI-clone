//
//  DashboardVC.swift
//  Hubtel Clone
//
//  Created by mac on 30/07/2022.
//

import UIKit

class DashboardVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionview: UICollectionView?
    
   // var sections = MockData.shared.pageData
   
    
    
    struct MenuSection {
        let title: String
        let data: [MenuItem]
    }
    
    struct Transaction{
        let name: String
        let time: String
        let compName: String
        let amount: String
        let isDone: Bool
        let date: String
    }
    
    struct TransactionSection{
        let date: String
        let transactions: [Transaction]
    }
    
   
    var transactionSections = [TransactionSection]()
    
    var transactions = [Transaction]()
    var newtransactions = [Transaction]()
    
    
    
    var menusection = [MenuSection]()
    
    var banner: bannerItem?
    var menuitems = [MenuItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        overrideUserInterfaceStyle = .light
        
        getItems()
        
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        guard let collectionview = collectionview else {
            return
        }
        
        
      

        collectionview.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.identifier)
        
        collectionview.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        collectionview.register(TransactionCell.self, forCellWithReuseIdentifier: TransactionCell.identifier)
        
        collectionview.register(PromoCell.self, forCellWithReuseIdentifier: PromoCell.identifier)
        
     
        collectionview.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        view.addSubview(collectionview)
         
        collectionview.translatesAutoresizingMaskIntoConstraints = false
         
         
        collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -2).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 2).isActive = true
        
        
        
        collectionview.reloadData()
        

        // Do any additional setup after loading the view.
    }
    
    
    func getItems(){
        
        
        banner = bannerItem(balanceVale: "34")
        
        let menu1 = MenuItem(title: "Groceries", image: #imageLiteral(resourceName: "groceries"))
        let menu2 = MenuItem(title: "Food", image: #imageLiteral(resourceName: "chicken"))
        let menu3 = MenuItem(title: "Shops", image: #imageLiteral(resourceName: "shops"))
        
        let menu4 = MenuItem(title: "Send Money", image: #imageLiteral(resourceName: "sendmoney"))
        let menu5 = MenuItem(title: "Top Up & Betting", image: #imageLiteral(resourceName: "prepaid"))
        let menu6 = MenuItem(title: "Pay Bills", image: #imageLiteral(resourceName: "bill"))
        
        let menu7 = MenuItem(title: "SMS & Money", image: #imageLiteral(resourceName: "sms"))
        let menu8 = MenuItem(title: "Request Money", image: #imageLiteral(resourceName: "payment"))
        
        
        
        
        menuitems.append(menu1)
        menuitems.append(menu2)
        menuitems.append(menu3)
        menuitems.append(menu4)
        menuitems.append(menu5)
        menuitems.append(menu6)
        
        menuitems.append(menu7)
        menuitems.append(menu8)
        
        let section = MenuSection(title:"menu", data: menuitems)
        
        menusection.append(section)
        
        
        let trans1 = Transaction(name: "KFC", time: "03:55 GMT", compName: "kfc", amount: "GHS 99.00", isDone: true,date:"Mar 10 2022" )
        
        let trans2 = Transaction(name: "KFC", time: "02:23 GMT", compName: "kfc", amount: "GHS 50.00", isDone: true,date:"Mar 5 2022" )
        let trans3 = Transaction(name: "KFC", time: "02:22 GMT", compName: "kfc", amount: "GHS 13.00", isDone: true,date:"Mar 5 2022" )
        let trans4 = Transaction(name: "KFC", time: "01:51GMT", compName: "kfc", amount: "GHS 10.00", isDone: true,date:"Mar 5 2022" )
        let trans5 = Transaction(name: "KFC", time: "17:39GMT", compName: "kfc", amount: "GHS 39.00", isDone: true,date:"Mar 3 2022" )
        let trans6 = Transaction(name: "KFC", time: "11:GMT", compName: "kfc", amount: "GH39", isDone: true,date:"Mar 3 2022" )
        let trans7 = Transaction(name: "KFC", time: "11:GMT", compName: "kfc", amount: "GH39", isDone: true,date:"Mar 10 2022" )
        
        
        
        transactions.append(trans1)
        transactions.append(trans4)
        transactions.append(trans5)
      //  transactions.append(trans6)
        transactions.append(trans2)
        transactions.append(trans3)
        
        
        
        
        
        var dates = [String]()

        //getting dates from transactions
        for item in transactions {
            //   print("\(key) : \(value)")
            if(dates.contains(item.date) != true){
                dates.append(item.date)
            }
         
           }

        //using dates to sort transactions in date
        for date in dates {

            for item in transactions {
                if(date == item.date){
                    
                    //appending transaction with particular date in group
                    newtransactions.append(item)
                    
                    
            }
            }
            //appending group transactions into transaction section
            transactionSections.append(TransactionSection(date: date, transactions: newtransactions))
            
            //clearing group transaction for new date
            newtransactions.removeAll()
            
        }
        
        
        
       
        
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout{[weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            
            if sectionIndex == 0{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
               // section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                
              
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                return section
            }else if sectionIndex == 1{
                let section = self.menusection[sectionIndex - 1].title
                
                switch section{
                case "menu":
                    //item
                    
                    
                    
                    
                    
                    let verticalSubItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    
                    verticalSubItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                    
                    
                    let verticalSubGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.333)), subitem: verticalSubItem, count: 3 )
                    
                    let verticalSubItem3 = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    
                    verticalSubItem3.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                    
                    
                    let verticalSubGroup3 = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.333)), subitem: verticalSubItem3, count: 2 )
                    
                  /*  let verticalSubItem2 = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
                    
                    verticalSubItem2.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
                    
                    
                    let verticalSubGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitem: verticalSubItem, count: 2 )*/
                    
                    
                    
               /*    var noOfColumns = 3
                    
                    if (layoutEnvironment.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
                        noOfColumns = 3
                        
                    }*/
                    
                  //  let noOfColumns = layoutEnvironment.traitCollection.horizontalSizeClass == .compact ? 3 : 6
                    
                    //group
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), subitems: [verticalSubGroup,verticalSubGroup,verticalSubGroup3])
                 //   group.interItemSpacing = .fixed(1)
                    //fractional height is heihgt of group if horizontal but heihgt og item if vertical
                    
                    //section
                    let section = NSCollectionLayoutSection(group: group)
                    //scroll behavior/direction
                   // section.orthogonalScrollingBehavior = .continuous
                    section.interGroupSpacing = 10
                    
                    section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                    
                    //takes header and footer
                    section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                    
                    //prevent header from following padding insets of main cell
                    section.supplementariesFollowContentInsets = false
                    
                    return section
                
                
            default:
                return nil
             
                
            }
            
            }else if sectionIndex == 2{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
                
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                

               
                    
          
                    
                section.boundarySupplementaryItems = [self.supplementaryFooterItem()]
                
                return section
            }else{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
                
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                

                let headerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .estimated(30))
                    
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                    
                section.boundarySupplementaryItems = [sectionHeader]
               
                return section
            }
         
                
      
        }
        
     
    }
    
    
    
    func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .bottom)
       }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
       }

   
    
    
    func numberOfSections (in collectionview: UICollectionView) -> Int {
        return menusection.count + 2 + transactionSections.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
            
        }else if section == 1{
            return menusection[section - 1].data.count
        } else if section == 2{
            return 1
        }else{
            return transactionSections[section - 3].transactions.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(indexPath.section)
        
        if(indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCell.identifier , for: indexPath) as! TopBannerCell
            
            
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2524197812)
            
            return cell
        }else if(indexPath.section == 1){
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier , for: indexPath) as! MenuCell
            
            let title = menusection[indexPath.section - 1].data[indexPath.row].title
            let image = menusection[indexPath.section - 1].data[indexPath.row].image
            
            cell.itemImage.image = image
            
            cell.itemLabel.text = title
           
            
            return cell
               // return HeaderCell()
            }
        else if(indexPath.section == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCell.identifier , for: indexPath) as! PromoCell
            
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransactionCell.identifier , for: indexPath) as! TransactionCell
            
            let title = transactionSections[indexPath.section - 3].transactions[indexPath.row].name
            let amount = transactionSections[indexPath.section - 3].transactions[indexPath.row].amount
            let time = transactionSections[indexPath.section - 3].transactions[indexPath.row].time
            
            cell.compTitleLabel.text = title
            cell.amountLabel.text = amount
            cell.compLabel.text = title
            cell.timeLabel.text = time
            
            
            return cell
            }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
            header.headerlabel.font = UIFont.boldSystemFont(ofSize: 22)
            header.headerlabel.text = "Good evening, PHILIP"
            header.backgroundColor = nil
            
            if(indexPath.section == 2){
            header.headerlabel.font = UIFont.boldSystemFont(ofSize: 17)
            header.headerlabel.text = "Recent transactions"
            }
            if(indexPath.section > 2){
                
                 let date = transactionSections[indexPath.section - 3].date
                
                header.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)
                header.headerlabel.text = date
                header.headerlabel.font = header.headerlabel.font.withSize(14)
            }
            
            return header
        default:
            return HeaderCell()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
