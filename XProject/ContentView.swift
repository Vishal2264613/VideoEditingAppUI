//
//  ContentView.swift
//  XProject
//
//  Created by vishal pawar on 2021-10-27.
//

import SwiftUI
import AVKit
struct ContentView: View {
    
    @State private var isShowingPicker = false
    private var avatarImage = UIImage(named: "AddVideo")!
    private var emptyImage = UIImage(named: "emptyImage")!
    @State var url: URL = URL(fileURLWithPath: "empty")
    var screen = UIScreen.main.bounds.size.width
    
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                if url == URL(fileURLWithPath: "empty"){
                   
                    Rectangle()
                        .frame(width: screen - 20, height: screen + 50)
                        .cornerRadius(40)
                        .foregroundColor(Color.blue.opacity(0.3))
                        .blur(radius: 1)
                        .overlay(
                            Image(uiImage:emptyImage)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                               
                                .frame(width: 150, height: 150)
                                
                        )
                }else {
                    VideoPlayer(player: AVPlayer(url: url),
                                videoOverlay:{
                        
                    })
                }
                Image(uiImage:avatarImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.all,6)
                    .background(Color(#colorLiteral(red: 0.9314960837, green: 0.9500115514, blue: 0.9891317487, alpha: 1)))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 6, x: 5, y: 5)
                    .shadow(color: .white, radius: 5, x: -5, y: -5)
                    .padding()
                
                    .onTapGesture {
                        isShowingPicker = true
                    }
                Spacer()
            }.offset(y:20)
            
            
                .sheet(isPresented: $isShowingPicker, content: {
                    
                    videoPicker(url: $url)
                })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
