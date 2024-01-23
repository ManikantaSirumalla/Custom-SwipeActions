//
//  Model.swift
//  Custom SwipeActions
//
//  Created by Manikanta Sirumalla on 24/01/24.
//

import Foundation
import SwiftUI

struct CEOModel {
    let name: String
    let company: String
    let dob: String
    let country: String
    let image: String
    var isFavorite: Bool = false
}

struct AlertItem: Identifiable {
    var id = UUID()
    var alert: Alert
}
