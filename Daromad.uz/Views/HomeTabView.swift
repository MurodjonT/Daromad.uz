//
//  HomeTabView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 27/05/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "person.crop.circle.fill")
                }
            
            
        }
    }
}

#Preview {
    HomeTabView()
}
