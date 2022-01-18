//
//  URLImage.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 17.01.2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    let urlString: String
    
    @State var data: Data?
    
    var body: some View{
        
        if let data = data, let uiimage = UIImage(data: data){
            
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 60)
                .background(Color.gray)
        }
        else{
            
            Image(systemName: "video")
                .resizable()
                .frame(width: 80, height: 60)
                .background(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){data,
            _,_ in
            self.data = data
        }
        task.resume()
    }
    
    
}
