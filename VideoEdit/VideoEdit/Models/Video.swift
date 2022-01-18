//
//  Video.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 17.01.2022.
//

import Foundation
struct Video: Codable, Hashable {
    
    let description: String
    let sources: [String]
    let subtitle: String
    let thumb: String
    let title: String
}

