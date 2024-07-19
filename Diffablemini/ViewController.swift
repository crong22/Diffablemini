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
        label.backgroundColor = .blue
        label.text = "설정"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: creatLayout())
    
    // <섹션을 구분해 줄 데이터 타입, 셀에 들어가는 데이터 타입>
    var dataSource : UICollectionViewDiffableDataSource<String, Setting>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationbg()
        configuration()
    }
    
    private func creatLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemBlue
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    private func configurationbg() {
        view.backgroundColor = .black
    }
    
    private func configuration() {
        
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

