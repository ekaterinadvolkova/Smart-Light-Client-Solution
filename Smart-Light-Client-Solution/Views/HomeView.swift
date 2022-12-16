//
//  HomeView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @Binding var tabSelection: Int
    @State private var searchText = ""
    @State private var isPressed = false
    var ledOn: Bool = false
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                VStack(
                    alignment: .center,
                    spacing: 10
                ) {
                    
                    Text("My Home")
                        .font(.custom("Poppins Bold", size: 40))
                    
                    //add searchbar
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(.lightGray))
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search ..", text: $searchText)
                        }
                        .foregroundColor(.white)
                        .padding(.leading, 13)
                    }
                    .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                    
                }.background(.white)
                
                
                Spacer().frame(height: 10)
                
                var spaces: [String] = ["Kitchen", "Living Room", "Garage", "Bathroom", "Cabinet", "Storage", "Library", "Sauna", "Game Room", "Wine Cellar"]
                
                // scrollable view with names of the rooms
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<spaces.count) {i in
                            if ( i != 0){
                                Text("\(spaces[i])")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .frame(width: 150, height: 75)
                                    .background(.black)
                                    
                            } else {
                                Text("\(spaces[i])")
                                    .foregroundColor(.white)
                                    .font(.title).bold()
                                    .frame(width: 170, height: 75)
                                    .background(.black)
                            }
                            
                        }
                    }
                }.frame(height: 100)
                
                Spacer().frame(height: 20)
                
                ZStack(
                ){
                    
                    HStack(spacing:10){
                        
                        Button(action: {
                            
                                if let url = URL(string: (backendURL + on)) {
                                    let urlSession = URLSession(configuration: .default).dataTask(with: url)
                                    urlSession.resume()
                                }
                                ledOn == true

                        }, label: {
                            Image(!isPressed ? "AllLightOn" : "AllLightOff").resizable()
                        }).buttonStyle(.plain)
                            .pressAction {
                                isPressed = true
                            } onRelease: {
                                isPressed = false
                            }
                        
                        Button(action: {
                            if let url = URL(string: (backendURL + off)) {
                                let urlSession = URLSession(configuration: .default).dataTask(with: url)
                                urlSession.resume()
                            }
                            ledOn == false
                        }, label: {
                            Image("BackLightOff").resizable()
                        }).buttonStyle(.plain)
            
                    }.frame(width: 360, height: 240)
                    
                    Spacer().frame(height: 20)
                

                }.frame(width: 360, height: 220)

                HStack(spacing:10){
                    
                    Button(action: { }, label: {
                        Image("LuminaireOff").resizable()
                    }).buttonStyle(.plain)
                        
                    Button(action: { }, label: {
                        Image("ChandelierOff").resizable()
                    }).buttonStyle(.plain)
        
                }.frame(width: 360, height: 220)
                
            }.background(Color.white)
        }
        .padding()
        
    }
}

struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}
 
 
extension View {
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressActions(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}
 
