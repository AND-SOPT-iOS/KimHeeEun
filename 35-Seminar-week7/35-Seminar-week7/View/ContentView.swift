//
//  ContentView.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 11/30/24.
//

import SwiftUI

struct HomeView: View {
    private var viewModel = HomeViewModel()
    
    let columns = [GridItem(.flexible())]
    let rows = [GridItem(.flexible())]
                         
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    HStack() {
                        Text("Instagram")
                            .font(.largeTitle)
                        //.font(.custom("Apple Chancery", size: 30)) // 폰트 추가 필요.
                        Spacer()
                        HStack {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                    }
                    .padding()
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows) {
                            ForEach(0..<15) { num in
                                StroyCell(storyData: viewModel.storyDatas[num])
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 100)
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                    
                    LazyVGrid(columns: columns) {//(columns: columns)
                        ForEach(0..<20) { num in
                            PostingCell(postingData: viewModel.postDatas[num])
                                .padding()
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "plus.square")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "video")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(Color.black)
    }
}

#Preview {
    ContentView()
}
