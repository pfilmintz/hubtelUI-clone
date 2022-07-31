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
    
    struct Section {
        let title: String
        let data: [MenuItem]
    }
    
    
   
    
    
    var sections = [Section]()
    
    var banner: bannerItem?
    var menuitems = [MenuItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        banner = bannerItem(balanceVale: "34")
        
        let menu1 = MenuItem(title: "Groceries", image: "Groceries")
        let menu2 = MenuItem(title: "Food", image: "Food")
        let menu3 = MenuItem(title: "Shops", image: "Shops")
        
        let menu4 = MenuItem(title: "3232", image: "mentor")
        let menu5 = MenuItem(title: "3232", image: "mentor")
        let menu6 = MenuItem(title: "3232", image: "mentor")
        
        let menu7 = MenuItem(title: "3232", image: "mentor")
        let menu8 = MenuItem(title: "3232", image: "mentor")
        
        menuitems.append(menu1)
        menuitems.append(menu2)
        menuitems.append(menu3)
        menuitems.append(menu4)
        menuitems.append(menu5)
        menuitems.append(menu6)
        
        menuitems.append(menu7)
        menuitems.append(menu8)
        
        let section2 = Section(title:"menu", data: menuitems)
        
        sections.append(section2)
        
        
        
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        guard let collectionview = collectionview else {
            return
        }
        
        
      

        collectionview.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.identifier)
        
        collectionview.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
     
        
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
                let section = self.sections[sectionIndex - 1].title
                
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
            
            }else{
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
                
                return section
            }
         
                
      
        }
        
     
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
       }

   
    
    
    func numberOfSections (in collectionview: UICollectionView) -> Int {
        return sections.count + 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
            
        }else if section == 1{
            return sections[section - 1].data.count
        } else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(indexPath.section)
        
        if(indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCell.identifier , for: indexPath) as! TopBannerCell
            
            cell.backgroundColor = .lightGray
            
            return cell
        }else if(indexPath.section == 1){
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier , for: indexPath) as! MenuCell
            
            let title = sections[indexPath.section - 1].data[indexPath.row].title
            
            cell.itemLabel.text = title
           
            
            return cell
               // return HeaderCell()
            }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCell.identifier , for: indexPath) as! PromoCell
            
            
            return cell
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
            
           // header.headerlabel.text = "title"
            
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
