//
//  SettingsView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 18/05/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Settings page")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(.rect(cornerRadius: 18))
            
    }
}

#Preview {
    SettingsView()
}
