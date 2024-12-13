//
//  PostingCell.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 12/14/24.
//

import SwiftUI

struct PostingCell: View {
    let postingData: PostData
    
    var body: some View {
        let isStroke = postingData.storyCategory == .nothing ? false : true
        let strokeColor = postingData.storyCategory == .all ? Color.purple : Color.green
        
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    postingData.userProfileImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    if isStroke {
                        Circle()
                            .stroke(strokeColor, lineWidth: 2) // 테두리
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.clear)
                    }
                }
                Text(postingData.userID)
            }
            Rectangle()
                .fill(Color.gray)
                .overlay(
                    postingData.postImage
                        .resizable()
                        .scaledToFit()
                )
            
            HStack(spacing: 10) {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Image(systemName: "message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Spacer()
                Image(systemName: "bookmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding(.vertical, 10)
            
            Text("좋아요 \(postingData.likedCount)개")
                
            Text("\(postingData.userID) ")
                .foregroundColor(Color.black)
            + Text(postingData.postContent)
        }
        .frame(height: 600)
    }
}

#Preview {
    ContentView()
}
