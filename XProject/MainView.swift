//
//  MainView.swift
//  XProject
//
//  Created by vishal pawar on 2021-10-28.
//

import SwiftUI


struct MainView: View {
    @State var dark = false
    @State var show = false
    
    var body: some View {
        
        Home(dark: $dark, show: $show)
            .offset(x: self.show ? 0 : 0 )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
struct Home: View {
    @Binding var dark: Bool
    @Binding var show: Bool
    var screen = UIScreen.main.bounds.size.width
    @State var lineWidth: CGFloat = 1
    var body: some View {
        ZStack{
           
            VStack{
                Wave()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue),Color(.systemPurple)]), startPoint: .topLeading, endPoint: .topTrailing))
                    .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
                    .overlay(
                        HStack{
                            Button(action: {
                                withAnimation(.default){
                                    self.show.toggle()
                                    
                                    self.lineWidth = 0
                                }
                            }){
                                Image(systemName: "text.justify")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                
                            }.offset(x:10,y:self.show ? 50 : 20)
                            Spacer()
                            
                            Text("Lyrico")
                            
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .offset(x:-10,y: self.show ? 50 : 20)
                            Spacer()
                        }
                    )
                
                    .frame(width: screen, height: screen/2)
                    .offset(y: self.show ? 0 : -25)
                    .ignoresSafeArea()
                
                VStack{
                    ContentView()
                }.padding(5)
                
            }
            .background(Color(#colorLiteral(red: 0.9314960837, green: 0.9500115514, blue: 0.9891317487, alpha: 1)))
            .padding(.vertical, 25)
            .frame(height: self.show ? UIScreen.main.bounds.height - 200 : UIScreen.main.bounds.height)
            .background((self.dark ?  Color.black : Color.white).ignoresSafeArea())
            .cornerRadius(25)
            .ignoresSafeArea()
            .offset(x: self.show ? 320 : 0)
            .zIndex(2)
            
            HStack{
                Menu(dark: self.$dark, show: self.$show, lineWidth: self.$lineWidth)
                    .preferredColorScheme(self.dark ? .dark : .light)
                    .offset(x: self.show ? 0 : -UIScreen.main.bounds.width )
                
            }.zIndex(1)
            
        }
        
    }
}
struct Menu: View {
    @Binding var dark : Bool
    @Binding var show : Bool
    @Binding var lineWidth: CGFloat
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    Button(action: {
                        withAnimation(.default){
                            self.show.toggle()
                            self.lineWidth = 1
                        }
                    }, label: {
                        Image(systemName: "arrow.backward.circle")
                            .font(.title)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                    })
                }
                
                .padding(.bottom,25)
                
                Image("default-avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                
                    .clipShape(Circle())
                VStack(spacing: 12){
                    Text("Scarlett")
                    
                    Text("Developer")
                        .font(.caption)
                }
                .padding(.top,25)
                
                HStack(spacing: 4){
                    Image(systemName: "moon.fill")
                        .font(.title)
                    
                    Text("Dark Mode")
                    Spacer()
                    Button(action: {
                        self.dark.toggle()
                        
                        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                        
                        
                    }, label: {
                        Toggle("",isOn: $dark)
                    })
                }
                .padding(.top,25)
                
                Group{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 12){
                            Image(systemName: "circle.grid.cross")
                                .font(.title)
                                .foregroundColor(.yellow)
                            Text("Story")
                            Spacer()
                        }
                    }).padding(.top,25)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 17){
                            Image(systemName: "person")
                                .font(.title)
                                .foregroundColor(.red)
                            Text("Chats")
                            Spacer()
                        }
                    }).padding(.top,5)
                    Divider()
                        .padding(.top,25)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 10){
                            Image(systemName: "photo")
                                .font(.title)
                                .foregroundColor(.purple)
                            Text("Media and Photos")
                            Spacer()
                        }
                    }).padding(.top,25)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 15){
                            Image(systemName: "gearshape")
                                .font(.title)
                                .foregroundColor(.green)
                            Text("Setting and Privacy")
                            Spacer()
                        }
                    }).padding(.top,5)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 17){
                            Image(systemName: "phone.circle")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("Help Centre")
                            Spacer()
                        }
                    }).padding(.top,5)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 17){
                            Image(systemName: "message.circle")
                                .font(.title)
                                .foregroundColor(.orange)
                            Text("Notifications")
                            Spacer()
                        }
                    }).padding(.top,5)
                }
                Spacer()
            }
            
            .foregroundColor(.primary)
            .padding(.top,50)
            .padding(.horizontal,20)
            .padding(.trailing, 100)
            
            
        }
        .frame(width: UIScreen.main.bounds.width )
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4958590269, green: 0.9037142396, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.460265398, green: 0.4227524698, blue: 0.9135807753, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
        //        .background((self.dark ?  Color.black : Color.white).ignoresSafeArea())
        //        .overlay(Rectangle().stroke(Color.primary.opacity(0.2),lineWidth: 2).shadow(radius: 3 ).ignoresSafeArea())
    }
    
}
