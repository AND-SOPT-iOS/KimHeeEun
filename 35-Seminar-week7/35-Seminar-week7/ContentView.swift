//
//  ContentView.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible())]
    let rows = [GridItem(.flexible())]
                         
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(1..<100) { num in
                        VStack {
                            Circle()
                                .fill(Color.red)
                                .stroke(Color.blue, lineWidth: 5)
                                .frame(width: 80, height: 80)
                            Text("id")
                        }
                    }
                }
                .frame(height: 100)
                .padding()
            }
            .scrollIndicators(.hidden)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {//(columns: columns)
                    ForEach(0..<100) { num in
                        VStack(alignment: .leading) {
                            HStack {
                                Circle()
                                    .fill(Color.red)
                                    .stroke(Color.blue, lineWidth: 2)
                                    .frame(width: 50, height: 50)
                                Text("id")
                            }
                            Rectangle()
                                .fill(Color.blue)
                            HStack {
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
                            Text("좋아요 4983개")
                            
                            Text("samsungLions ")
                                .foregroundColor(Color.black)
                            + Text("#구자욱")
                                .foregroundColor(Color.blue)
                        }
                        .frame(height: 600)
                    }
                    .padding()
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
