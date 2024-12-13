//
//  PostData.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 12/14/24.
//

import SwiftUI

struct PostData: Identifiable {
    let id: UUID
    let userID: String
    let userProfileImage: Image
    let postImage: Image
    let likedCount: Int
    let postContent: String
    let storyCategory: StoryCategory
}

enum StoryCategory {
    case nothing, all, friend
}

let mockPostData: [PostData] = [
    PostData(id: UUID(), userID: "h.eeeeun__", userProfileImage: Image(systemName: "figure.walk"), postImage: Image(systemName: "photo"), likedCount: 103, postContent: "Amazing view!", storyCategory: .all),
    PostData(id: UUID(), userID: "john_doe", userProfileImage: Image(systemName: "figure.wave"), postImage: Image(systemName: "house"), likedCount: 215, postContent: "My new home 🏠", storyCategory: .nothing),
    PostData(id: UUID(), userID: "jane_smith", userProfileImage: Image(systemName: "person.crop.circle"), postImage: Image(systemName: "leaf"), likedCount: 98, postContent: "Nature is beautiful.", storyCategory: .all),
    PostData(id: UUID(), userID: "michael_b", userProfileImage: Image(systemName: "figure.stand"), postImage: Image(systemName: "sun.max"), likedCount: 150, postContent: "Sunny vibes 🌞", storyCategory: .all),
    PostData(id: UUID(), userID: "anna_lee", userProfileImage: Image(systemName: "person.crop.square"), postImage: Image(systemName: "cloud.fill"), likedCount: 73, postContent: "Cloudy day ☁️", storyCategory: .friend),
    PostData(id: UUID(), userID: "david_park", userProfileImage: Image(systemName: "person.3"), postImage: Image(systemName: "star"), likedCount: 200, postContent: "Starry night 🌟", storyCategory: .all),
    PostData(id: UUID(), userID: "sophia_w", userProfileImage: Image(systemName: "figure.run"), postImage: Image(systemName: "music.note"), likedCount: 185, postContent: "Music heals the soul 🎵", storyCategory: .all),
    PostData(id: UUID(), userID: "oliver_k", userProfileImage: Image(systemName: "person.crop.circle.badge.plus"), postImage: Image(systemName: "bicycle"), likedCount: 142, postContent: "Morning ride 🚴‍♂️", storyCategory: .nothing),
    PostData(id: UUID(), userID: "emma_j", userProfileImage: Image(systemName: "person.crop.square.filled.and.at.rectangle"), postImage: Image(systemName: "moon.stars"), likedCount: 305, postContent: "Moonlit night 🌙", storyCategory: .friend),
    PostData(id: UUID(), userID: "lucas_h", userProfileImage: Image(systemName: "person.3.sequence.fill"), postImage: Image(systemName: "camera"), likedCount: 410, postContent: "Captured memories 📸", storyCategory: .nothing),
    PostData(id: UUID(), userID: "mia_t", userProfileImage: Image(systemName: "figure.archery"), postImage: Image(systemName: "flame"), likedCount: 230, postContent: "Feeling the heat 🔥", storyCategory: .nothing),
    PostData(id: UUID(), userID: "noah_c", userProfileImage: Image(systemName: "figure.climbing"), postImage: Image(systemName: "bolt"), likedCount: 176, postContent: "Lightning strikes ⚡", storyCategory: .nothing),
    PostData(id: UUID(), userID: "amelia_r", userProfileImage: Image(systemName: "figure.outdoor.cycling"), postImage: Image(systemName: "heart"), likedCount: 320, postContent: "Spread love ❤️", storyCategory: .nothing),
    PostData(id: UUID(), userID: "liam_p", userProfileImage: Image(systemName: "figure.cooldown"), postImage: Image(systemName: "globe"), likedCount: 220, postContent: "Exploring the world 🌍", storyCategory: .nothing),
    PostData(id: UUID(), userID: "isabella_m", userProfileImage: Image(systemName: "person.crop.circle.badge.checkmark"), postImage: Image(systemName: "mountain"), likedCount: 115, postContent: "Hiking the peaks 🏔️", storyCategory: .nothing),
    PostData(id: UUID(), userID: "james_d", userProfileImage: Image(systemName: "figure.mind.and.body"), postImage: Image(systemName: "tree"), likedCount: 245, postContent: "In the woods 🌳", storyCategory: .nothing),
    PostData(id: UUID(), userID: "ava_k", userProfileImage: Image(systemName: "figure.roll"), postImage: Image(systemName: "car"), likedCount: 180, postContent: "Road trip 🚗", storyCategory: .nothing),
    PostData(id: UUID(), userID: "william_m", userProfileImage: Image(systemName: "person.and.background.dotted"), postImage: Image(systemName: "airplane"), likedCount: 340, postContent: "Off to new adventures ✈️", storyCategory: .nothing),
    PostData(id: UUID(), userID: "charlotte_l", userProfileImage: Image(systemName: "figure.skiing.crosscountry"), postImage: Image(systemName: "sparkles"), likedCount: 290, postContent: "Magic in the air ✨", storyCategory: .nothing),
    PostData(id: UUID(), userID: "henry_t", userProfileImage: Image(systemName: "figure.disc.sports"), postImage: Image(systemName: "waveform"), likedCount: 400, postContent: "Ride the wave 🌊", storyCategory: .nothing)
]
