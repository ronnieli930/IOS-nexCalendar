//
//  Badge.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct Badge: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    var imageName:String
    var description:String
}
