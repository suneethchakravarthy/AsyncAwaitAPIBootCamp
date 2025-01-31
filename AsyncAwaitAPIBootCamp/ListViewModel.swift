//
//  ListViewModel.swift
//  AsyncAwaitAPIBootCamp
//
//  Created by suneeth chakravarthy on 2025-01-30.
//

import Foundation

struct PostModel: Codable {
    let userId, id: Int
    let title, body: String
}

struct EndPointURls {
    static let posts = "https://jsonplaceholder.typicode.com/posts"
}

@Observable
class ListViewModel {
 
    var models: [PostModel] = []
    
    func loadData() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: EndPointURls.posts)!)
            try await MainActor.run {
                self.models = try JSONDecoder().decode([PostModel].self, from: data)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
