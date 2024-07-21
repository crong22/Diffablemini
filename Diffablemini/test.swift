//private func configureDataSource() {
//    let registration = UICollectionView.CellRegistration<UICollectionViewListCell, User> { cell, indexPath, item in
//        // 셀 배경 설정
//        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
//        backgroundConfig.backgroundColor = .white
//        cell.backgroundConfiguration = backgroundConfig
//
//        // 이름과 날짜를 같은 행에 배치
//        let nameDateText = "\(item.name)   \(item.date)"
//        
//        // 셀 설정
//        var contentConfig = UIListContentConfiguration.valueCell()
//        contentConfig.text = nameDateText
//        contentConfig.textProperties.color = .black
//        contentConfig.textProperties.font = .systemFont(ofSize: 16, weight: .bold)
//        contentConfig.secondaryText = item.content
//        contentConfig.secondaryTextProperties.color = .darkGray
//        contentConfig.secondaryTextProperties.font = .systemFont(ofSize: 14, weight: .regular)
//        contentConfig.image = UIImage(named: item.image)
//        contentConfig.imageProperties.maximumSize = CGSize(width: 35, height: 35)
//
//        cell.contentConfiguration = contentConfig
//    }
//
//    dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
//        let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
//        return cell
//    })
//}
