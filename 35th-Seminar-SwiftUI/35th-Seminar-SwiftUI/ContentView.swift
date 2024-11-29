//
//  ContentView.swift
//  35th-Seminar-SwiftUI
//
//  Created by 김희은 on 11/23/24.
//

import SwiftUI

struct ChartRow: View {
    let app: AppStoreApplication
    
    var body: some View {
        // 여기는 부모 뷰! switch넣어서 값 변경하고 싶으면, buttonTitleLabel을 @State private var isButton 로 선언했어야 함 ! ! !
        // 하위 뷰에서 @Binding var isButton 로 선언하여 하위 뷰에 넘겨줄 수 있다 !! + 하위에서 값을 변경하여야 할 때! @State로 버튼을 선언할 경우, 부모 뷰의 버튼상태와 서로 다른 생명주기?를 갖게 됨.
        //parameter 넘길 때 $사인이 필요
        
        HStack {
            app.iconImage
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.clear)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 60, height: 60)
                )
            HStack {
                Text(app.ranking.description)
                    .font(.headline)
                VStack(alignment: .leading) {
                    Text(app.title)
                    Text(app.subTitle)
                        .font(.caption2)
                }
            }
            
            Spacer()
            
            Button {}
            label: {
                Text(app.downloadState)
                    .foregroundStyle(.blue)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            //            VStack {
            
            Text("AppStore")
                .font(.title3)
                .bold()
                .padding(10)
            
            List {
                Section(header: Text("인기차트")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .padding(.top)) {
                        ForEach(appList) { app in
                            ChartRow(app: app)
                        }
                    }
                
                Section(header: Text("추천 어플")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .padding(.top)) {
                        ForEach(appList) { app in
                            ChartRow(app: app)
                        }
                    }
                Section(header: Text("")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .padding(.top)) {
                        ForEach(appList) { app in
                            ChartRow(app: app)
                        }
                    }
            }
            .listStyle(.insetGrouped)
            Button {
                //actions
            }
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 70)
                        .foregroundStyle(.blue)
                    Text("다음")
                        .foregroundStyle(.white)
                        .backgroundStyle(.blue)
                }
                
            }
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
            .padding()
        }
        .navigationTitle("App Store")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
