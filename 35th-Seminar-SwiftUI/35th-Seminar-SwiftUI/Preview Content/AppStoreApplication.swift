//
//  App.swift
//  35th-Seminar-SwiftUI
//
//  Created by 김희은 on 11/23/24.
//

import Foundation
import SwiftUI

struct AppStoreApplication: Identifiable {
  let id: UUID
  let iconImage: Image
  let ranking: Int
  let title: String
  let subTitle: String
  let downloadState: String
  let category: AppCategory
}

enum DownloadState {
    case doDownload
    case downloaded
    case cloudDownload
}

enum AppCategory {
    case movie, music, book, game
}

let appList: [AppStoreApplication] = [
    AppStoreApplication(
        id: UUID(),
        iconImage: Image(systemName: "gamecontroller.fill"),
        ranking: 1,
        title: "Super Fun Game",
        subTitle: "Endless fun and adventures await!",
        downloadState: "다시 다운하기",
        category: .game
    ),
    AppStoreApplication(
        id: UUID(),
        iconImage: Image(systemName: "calendar"),
        ranking: 2,
        title: "Daily Planner",
        subTitle: "Organize your tasks efficiently",
        downloadState: "열기",
        category: .movie
    ),
    AppStoreApplication(
        id: UUID(),
        iconImage: Image(systemName: "person.fill"),
        ranking: 3,
        title: "ChatConnect",
        subTitle: "Connect with your friends in a new way",
        downloadState: "열기",
        category: .movie
    ),
    AppStoreApplication(
        id: UUID(),
        iconImage: Image(systemName: "film"),
        ranking: 4,
        title: "StreamX",
        subTitle: "Movies and shows anytime, anywhere",
        downloadState: "다운로드하기",
        category: .game
    ),
    AppStoreApplication(
        id: UUID(),
        iconImage: Image(systemName: "book.fill"),
        ranking: 5,
        title: "LearnSwift",
        subTitle: "Master Swift programming step-by-step",
        downloadState: "다운로드하기",
        category: .book
    )
]
