//
//  List.swift
//  Diffablemini
//
//  Created by 여누 on 7/19/24.
//

import Foundation

struct Setting: Hashable, Identifiable {
    let id = UUID()  // 고유. 데이터판별. 뷰X
    let title: String
}


