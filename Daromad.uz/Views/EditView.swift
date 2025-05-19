//
//  EditView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 18/05/25.
//

import SwiftUI

struct EditView: View {
    @State private var showDialog = false
    @State private var deleted = false

    var body: some View {
        VStack(spacing: 20) {
            Text(deleted ? "Data has been deleted" : "Data exists")
                .foregroundColor(deleted ? .red : .primary)

            Button("Delete data") {
                showDialog = true
            }
            .buttonStyle(.borderedProminent)
            .confirmationDialog("Are you sure you want to delete this data?", isPresented: $showDialog, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    deleted = true
                }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}

#Preview {
    
    EditView()
}
