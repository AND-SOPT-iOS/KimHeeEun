//
//  FinanceSection.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 11/1/24.
//

import Foundation

struct FinanceSection {
    let title: String
    let subtitle: String
    let showAllButton: Bool
}

extension FinanceSection {
    static let sectionData: [FinanceSection] = [
        FinanceSection(
            title: "",
            subtitle: "",
            showAllButton: false
        ),
        FinanceSection(
            title: "필수 금융 앱",
            subtitle: "App Store 에디터가 직접 골랐습니다",
            showAllButton: true
        ),
        FinanceSection(
            title: "유료 순위",
            subtitle: "",
            showAllButton: true
        ),
        FinanceSection(
            title: "무료 순위",
            subtitle: "",
            showAllButton: true
        )
    ]
}
