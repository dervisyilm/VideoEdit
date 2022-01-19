//
//  ViewModel.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 15.01.2022.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var videos: [Video] = []
    
    func fetch (){
        
        // define URL string
        guard let url = URL(string: "https://searchpanel-dot-tapstory.uc.r.appspot.com/devtask") else {
            return
        }
        
        
        // Request url and response data
        let task = URLSession.shared.dataTask(with: url){ [weak self]
            data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            // Convert from data to JSON
            do {
                let movies = try
                    JSONDecoder().decode([Movie].self, from: data)
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.videos = movies[0].videos
                }
                
                
            } catch  {
                print(error)
            }
            
        }
        task.resume()
        
    }
}

