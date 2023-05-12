//
//  ContentView.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            viewD()
                .tabItem(){
                    Image(systemName: "house")
                    
                }
            viewA()
                .tabItem(){
                    Image(systemName: "calendar")
                }
            viewB()
                .tabItem(){
                    Image(systemName: "clock")
                }
            viewC()
                .tabItem(){
                    Image(systemName: "mic")
                }
        }.accentColor(.black)
            .frame(width: 400, height: 800)
            .background(.thinMaterial)
            
            
        ZStack {
            Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 500, height: 500)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
