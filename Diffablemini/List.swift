//
//  List.swift
//  Diffablemini
//
//  Created by 여누 on 7/19/24.
//

import Foundation

struct Setting : Hashable {
    let title = ["전체 설정", "개인 설정", "기타"]
    let subTitle : detail
}

struct detail : Hashable {
    let content = [["공지사항", "실험실", "버전 정보"], ["개인/보관", "알림", "채팅", "멀티프로필"],["기타"]]
}
