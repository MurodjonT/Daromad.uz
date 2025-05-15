//
//  ContentView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TransactionViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 20) {
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Umumiy balans:")
                        .font(.headline)
                    Text("\(viewModel.balance, specifier: "%.2f") so'm")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(viewModel.balance >= 0 ? .green : .red)
                    
                    HStack {
                        Text("Daromad: \(viewModel.totalIncome, specifier: "%.2f") so'm")
                            .foregroundColor(.green)
                        Spacer()
                        Text("Xarajat: \(viewModel.totalExpense, specifier: "%.2f") so'm")
                            .foregroundColor(.red)
                        
                    }
                    .font(.system(size: 12))
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Text("So‘nggi harajatlar:")
                    .font(.headline)
                
                List() {
                    ForEach(viewModel.transactions.reversed()) { transaction in
                        VStack(alignment: .leading) {
                            Text(transaction.category)
                                .font(.headline)
                            Text(transaction.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                Text(transaction.date, style: .date)
                                    .font(.caption)
                                Spacer()
                                Text("\(transaction.amount, specifier: "%.2f") so'm")
                                    .foregroundColor(transaction.type == .income ? .green : .red)
                            }
                        }
                        
                        .padding(.vertical, 4)
                        .listRowBackground(Color.white)
                        
                    }
                    
                }
                .listStyle(.plain)
                //                .background(Color.red)
                Spacer()
                
                HStack {
                    NavigationLink(destination: AddTransactionView(viewModel: viewModel)) {
                        VStack {
                              Image(systemName: "minus.slash.plus")
                              Text("Harajat qo'shish")
                          }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                    
                    NavigationLink(destination: MonitoringView(viewModel: viewModel)) {
                        VStack {
                              Image(systemName: "chart.pie.fill")
                              Text("Monitoring")
                          }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .navigationTitle("Kunlik hisob")
                .navigationBarTitleDisplayMode(.inline)
                
            }
//            .border(Color(.red))
            .padding([.leading, .trailing], 16)
        }
    }
}

#Preview {
    HomeView()
}
