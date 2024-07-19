//
//  ViewController.swift
//  Diffablemini
//
//  Created by 여누 on 7/19/24.
//

import UIKit
import SnapKit



class ViewController: UIViewController {
    
    let titleLable : UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.text = "설정"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatLayout())
    // <섹션을 구분해 줄 데이터 타입, 셀에 들어가는 데이터 타입>
    var dataSource : UICollectionViewDiffableDataSource<String, Setting>!
    
    let sectionList = ["전체 설정", "개인 설정", "기타"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationbg()
        configuration()
        
        configureDataSource()
        updateSnapshot()
    }
    
    private func creatLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .black
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configurationbg() {
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
    }
    
    private func configuration() {
        
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, Setting>()
        
        let oneList = [Setting(title: "공지사항"),Setting(title: "실험실"),Setting(title: "버전정보")]
        let twoList = [Setting(title: "개인/보안"),Setting(title: "알림"),Setting(title: "채팅"),Setting(title: "멀티프로필")]
        let threeList = [Setting(title: "기타")]
        
        snapshot.appendSections(sectionList)
        snapshot.appendItems(oneList, toSection: sectionList[0])
        snapshot.appendItems(twoList, toSection: sectionList[1])
        snapshot.appendItems(threeList, toSection: sectionList[2])

        dataSource.apply(snapshot)
    }
    
    private func configureDataSource() {

        var registeration: UICollectionView.CellRegistration<UICollectionViewListCell, Setting>!
        
        registeration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            

            // 셀 배경 설정
            var cellconfiguration = UIBackgroundConfiguration.listPlainCell()
            cellconfiguration.backgroundColor = .black
            
            cell.backgroundConfiguration = cellconfiguration

            // 셀 설정
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.color = .white
            content.textProperties.font = .systemFont(ofSize: 16, weight: .regular)
            
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registeration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
}

