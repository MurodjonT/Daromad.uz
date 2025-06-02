//
//  Untitled.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//

import SwiftUI

struct MonitoringView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // DAROMADLAR
                VStack(alignment: .leading, spacing: 12) {
                    Text("Daromadlar ")
                        .font(.headline)
                    
                    ForEach(viewModel.incomeByCategory().sorted(by: { $0.value > $1.value }), id: \.key) { category, amount in
                        HStack {
                            Text(category)
                            Spacer()
                            Text("\(amount, specifier: "%.2f") so'm")
                                .foregroundColor(.green)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // XARAJATLAR
                VStack(alignment: .leading, spacing: 12) {
                    Text("Xarajatlar")
                        .font(.headline)
                    
                    ForEach(viewModel.expenseByCategory().sorted(by: { $0.value > $1.value }), id: \.key) { category, amount in
                        HStack {
                            Text(category)
                            Spacer()
                            Text("\(amount, specifier: "%.2f") so'm")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 12))
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Monitoring")
    }
}

#Preview {
    MonitoringView(viewModel: TransactionViewModel())
}
