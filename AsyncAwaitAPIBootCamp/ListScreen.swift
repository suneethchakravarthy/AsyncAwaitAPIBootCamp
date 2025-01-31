//
//  ContentView.swift
//  AsyncAwaitAPIBootCamp
//
//  Created by suneeth chakravarthy on 2025-01-30.
//

import SwiftUI

struct ListScreen: View {
    var viewModel = ListViewModel()
    var body: some View {
        VStack {
            NavigationStack {
                List(viewModel.models, id: \.id) { item in
                    NavigationLink {
                        Text(item.body)
                            .font(.headline)
                            .padding()
                    } label: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.body)
                                .font(.subheadline)
                        }
                    }                    
                }
            }
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    ListScreen()
}
