//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Gabriel do Prado Moreira on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var selectedTab: Int = 0
    var body: some View {
        
        VStack {
            ProfilePictureContainerView()
                .scaleEffect(isAnimating ? 1.0 : 1.2)
            ProfileTripsView()
                .position(x: (UIScreen.screenWidth / 2), y: (UIScreen.screenHeight * 0.08))
                .scaleEffect(isAnimating ? 1.0 : 1.2)
        }
        .onAppear(){
            withAnimation(.easeOut(duration: 0.3)){
                isAnimating = true
            }
        }
        .onDisappear(){
            isAnimating = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

