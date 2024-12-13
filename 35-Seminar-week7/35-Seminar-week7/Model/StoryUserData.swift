//
//  StoryUserData.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 12/14/24.
//

import SwiftUI

struct StoryUserData: Identifiable {
    let id: UUID
    let userID: String
    let userProfileImage: Image
    let storyCategory: StoryCategory
}

let mockStoryData: [StoryUserData] = [
    StoryUserData(id: UUID(), userID: "h.eeeeun__", userProfileImage: Image(systemName: "person.fill"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "john_doe", userProfileImage: Image(systemName: "figure.walk"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "jane_smith", userProfileImage: Image(systemName: "hexagon"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "michael_b", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "anna_lee", userProfileImage: Image(systemName: "bubble.left"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "david_park", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "sophia_w", userProfileImage: Image(systemName: "envelope.fill"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "oliver_k", userProfileImage: Image(systemName: "cloud.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "emma_j", userProfileImage: Image(systemName: "cloud"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "lucas_h", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "mia_t", userProfileImage: Image(systemName: "sun.max"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "noah_c", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "amelia_r", userProfileImage: Image(systemName: "leaf"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "liam_p", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend),
    StoryUserData(id: UUID(), userID: "isabella_m", userProfileImage: Image(systemName: "football"), storyCategory: .all),
    StoryUserData(id: UUID(), userID: "james_d", userProfileImage: Image(systemName: "person.fill"), storyCategory: .friend)

]
