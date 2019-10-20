import Foundation

let gregorianWeekdays = [
    NSLocalizedString("sunday", comment: ""),
    NSLocalizedString("monday", comment: ""),
    NSLocalizedString("tuesday", comment: ""),
    NSLocalizedString("wednesday", comment: ""),
    NSLocalizedString("thursday", comment: ""),
    NSLocalizedString("friday", comment: ""),
    NSLocalizedString("saturday", comment: "")
]

let nexWeekdays = [
    NSLocalizedString("monday", comment: ""),
    NSLocalizedString("tuesday", comment: ""),
    NSLocalizedString("wednesday", comment: ""),
    NSLocalizedString("thursday", comment: ""),
    NSLocalizedString("friday", comment: ""),
    NSLocalizedString("saturday", comment: ""),
    NSLocalizedString("sunday", comment: "")
]

let monthArr = [
    NSLocalizedString("january", comment: ""),
    NSLocalizedString("february", comment: ""),
    NSLocalizedString("march", comment: ""),
    NSLocalizedString("april", comment: ""),
    NSLocalizedString("may", comment: ""),
    NSLocalizedString("june", comment: ""),
    NSLocalizedString("july", comment: ""),
    NSLocalizedString("august", comment: ""),
    NSLocalizedString("september", comment: ""),
    NSLocalizedString("october", comment: ""),
    NSLocalizedString("november", comment: ""),
    NSLocalizedString("december", comment: "")
]

var tutorialsData: [Tutorial] = load(NSLocalizedString("tutorials.json", comment: ""))
let questionsData: [Question] = load(NSLocalizedString("questions.json", comment: ""))

func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file  = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Cannot find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cannot load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Cannot parse \(filename) as \(T.self):\n\(error)")
    }
    
}
