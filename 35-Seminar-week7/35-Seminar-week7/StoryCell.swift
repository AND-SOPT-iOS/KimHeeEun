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
        var strokeColor = storyData.storyCategory == .all ? Color.purple : Color.green
        
        VStack {
            ZStack {
                storyData.userProfileImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                Circle()
                    .stroke(strokeColor, lineWidth: 5) // 테두리
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.clear)
            }
            Text(storyData.userID)
        }
    }
}

#Preview {
    ContentView()
}
