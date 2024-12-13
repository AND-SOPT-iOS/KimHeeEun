//
//  StoryCell.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 12/14/24.
//

import SwiftUI

struct StroyCell: View {
    let storyData: StoryUserData
    
    var body: some View {
        VStack {
            ZStack {
                userImage
                circleStroke
            }
            Text(storyData.userID)
        }
    }
        
    private var userImage: some View {
        storyData.userProfileImage
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
    }
    
    private var circleStroke: some View {
        let strokeColor = self.storyData.storyCategory == .all ? Color.purple : Color.green
        return Circle()
            .stroke(strokeColor, lineWidth: 5) // 테두리
            .frame(width: 90, height: 90)
    }
}

#Preview {
    ContentView()
}
