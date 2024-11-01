//
//  App.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subtitle: String
    let category: String
    var downloadState: DownloadState
}

extension App {
    static let mockData: [App] = [
        App(
            iconImage: UIImage(systemName: "1.square.fill")!,
            ranking: 1,
            title: "1",
            subtitle: "1-1",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "2.square.fill")!,
            ranking: 2,
            title: "2",
            subtitle: "2-1",
            category: "엔터테인먼트",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "3.square.fill")!,
            ranking: 3,
            title: "토스",
            subtitle: "금융이 쉬워진다",
            category: "",
            downloadState: .download
        ),
        App(
            iconImage: UIImage(systemName: "4.square.fill")!,
            ranking: 4,
            title: "4",
            subtitle: "영화와 TV 프로그램 시청",
            category: "엔터테인먼트",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "5.square.fill")!,
            ranking: 5,
            title: "5",
            subtitle: "이메일과 캘린더",
            category: "생산성",
            downloadState: .redownload
        ),
        App(
            iconImage: UIImage(systemName: "6.square.fill")!,
            ranking: 6,
            title: "6",
            subtitle: "친구와 소통하기",
            category: "소셜 네트워킹",
            downloadState: .download
        ),
        App(
            iconImage: UIImage(systemName: "7.square.fill")!,
            ranking: 7,
            title: "7",
            subtitle: "게이머를 위한 채팅",
            category: "소셜 네트워킹",
            downloadState: .installed
        ),
        App(
            iconImage: UIImage(systemName: "8.square.fill")!,
            ranking: 8,
            title: "8",
            subtitle: "검색과 클라우드 서비스",
            category: "유틸리티",
            downloadState: .redownload
        ),
        App(
            iconImage: UIImage(systemName: "9.square.fill")!,
            ranking: 9,
            title: "9",
            subtitle: "무료 메시지와 통화",
            category: "소셜 네트워킹",
            downloadState: .update
        ),
        App(
            iconImage: UIImage(systemName: "10.square.fill")!,
            ranking: 10,
            title: "10",
            subtitle: "검색과 클라우드 서비스",
            category: "유틸리티",
            downloadState: .download
        )
    ]
}
