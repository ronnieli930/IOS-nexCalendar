import Foundation

struct Tutorial: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var imageUrl: String
    var isStarred: Bool
    var content: String
}

func markStar(tutorialIndex i: Int) {
    tutorialsData[i].isStarred.toggle()
    print(tutorialsData[i].id)
}

