import Foundation

struct Question: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var options: [String]
    var answer: Int
}

