//
//  ContentView.swift
//  35-Seminar-week7
//
//  Created by 김희은 on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let rows = [GridItem(.flexible())]
                         
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(1..<100) { num in
                        Rectangle()
                            .frame(width: 50, height: 50)
                    }
                }
                .frame(height: 50)
                .padding()
            }
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<100) { num in
                        Rectangle()
                            .frame(height: 100)
                    }
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
