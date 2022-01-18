//
//  ContentView.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 15.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationView{
            List{
                
                ForEach(viewModel.videos, id: \.self) { video in
                    
                    NavigationLink(destination: PlayerView(video: video)){
                        
                        HStack {
                            
                            URLImage(urlString: video.thumb)
                            
                            Text(video.title)
                                .bold()
                                
                        }
                    }
                    .padding(2)
                }
            }
            .navigationTitle("Movies")
            .onAppear{
                
                viewModel.fetch()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
