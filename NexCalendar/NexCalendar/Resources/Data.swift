//
//  Data.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

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

let monthArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

let badgeData:[Badge] = load("badges.json")

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