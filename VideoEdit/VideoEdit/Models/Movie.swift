//
//  Movie.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 17.01.2022.
//

import Foundation

/* Movie Model
 
 name and videos attribute
 name: String
 videos: Array
 
 */
struct Movie: Codable {
    
    let name: String
    let videos: [Video]
}
