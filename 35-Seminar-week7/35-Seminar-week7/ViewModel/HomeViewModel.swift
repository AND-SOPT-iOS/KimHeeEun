//
//  HomeViewModel.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 12/14/24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    let storyDatas: [StoryUserData]
    let postDatas: [PostData]
    
    init(storyDatas: [StoryUserData] = mockStoryData, postDatas: [PostData] = mockPostData) {
        self.storyDatas = storyDatas
        self.postDatas = postDatas
    }
}
