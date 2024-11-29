////
////  ChartRow.swift
////  35th-Seminar-SwiftUI
////
////  Created by 김희은 on 11/23/24.
////
//
//import SwiftUI
//
//struct ChartRow: View {
//    var body: some View {
//        let app: app
//        
//        HStack {
//            Image(systemName: "person")
//                .resizable()
//                .frame(width: 55, height: 55)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 15)
//                        .fill(.clear)
//                        .stroke(.black, lineWidth: 1)
//                        .frame(width: 60, height: 60)
//                        
//                )
//            HStack {
//                Text(app.ranking.description)
//                VStack {
//                    Text(app.title)
//                    Text(app.subTitle)
//                }
//            }
//            
//            Spacer()
//            
//            Button {}
//            label: {
//                Text(app.downloadState.hashValue.description)
//                    .foregroundStyle(.blue)
//            }
//        }
//    }
//}
