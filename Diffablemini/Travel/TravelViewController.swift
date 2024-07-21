//
//  TravelViewController.swift
//  Diffablemini
//
//  Created by 여누 on 7/21/24.
//

import UIKit
import SnapKit

class TravelViewController : UIViewController {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "TRAVLE TALK"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let searchbar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "친구 이름을 검색해보세요"
        return search
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = creatLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var dataSource : UICollectionViewDiffableDataSource<String, User>!
    
    let list = [ User(name: "Hue", date: "24.01.12", image: "profile_0", content: "왜요 요즘 코딩이 대세인데"),
                 User(name: "Jack", date: "24.01.12", image: "profile_6", content: "깃허브는 푸시하셨나여?"),
                 User(name: "Bran", date: "24.01.11", image: "profile_4", content: "과제 화이팅!"),
                 User(name: "Den", date: "24.01.10", image: "profile_3", content: "벌써 퇴근하세여?ㅎㅎㅎㅎㅎ"),
                 User(name: "내옆의앞자리에개발잘하는친구", date: "24.01.09", image: "profile_5", content: "내일 모닝콜 해주실분~~"),
                 User(name: "심심이", date: "24.01.08", image: "profile_7", content: "아닛 주말과제라닛")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationbg()
        configuration()
        
        configureDataSource()
        updateSnapshot()
    }
    
    private func creatLayout() -> UICollectionViewLayout {
//        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
//        configuration.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
        layout.minimumLineSpacing = 10
        return layout
    }

    private func configurationbg() {
        view.backgroundColor = .white
    }
    
    private func configuration() {
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(25)
        }
        
        view.addSubview(searchbar)
        searchbar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchbar.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, User>()
        
        snapshot.appendSections(["친구목록"])
        snapshot.appendItems(list, toSection: "친구목록")

        dataSource.apply(snapshot)
    }
    
    private func configureDataSource() {

        var registeration: UICollectionView.CellRegistration<TravelCollectionViewCell, User>!
        
        registeration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            
            cell.imageView.image = UIImage(named: itemIdentifier.image)
            cell.nameLabel.text = itemIdentifier.name
            cell.dateLabel.text = itemIdentifier.date
            cell.contentLabel.text = itemIdentifier.content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registeration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
