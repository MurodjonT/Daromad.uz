//
//  ContentView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TransactionViewModel()
    @State private var path = NavigationPath()
    @State private var showDialog = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Balance:")
                        Text("\(viewModel.balance, specifier: "%.2f") so'm")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(viewModel.balance >= 0 ? .green : .red)
                    }
                    HStack {
                        Text("Profit: \n\(viewModel.totalIncome, specifier: "%.2f") so'm")
                            .foregroundStyle(.green)
                        Spacer()
                        Text("Expense: \n\(viewModel.totalExpense, specifier: "%.2f") so'm")
                            .foregroundStyle(.red)
                    }
                    .font(.system(size: 14))
                 
                    
                }
                Section {
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
                                Text("\(transaction.amount.formatted()) so'm")
                                    .foregroundStyle(transaction.type.color)
                            }
                        }
                        .listRowBackground(Color.white)
                    }
                } header: {
                    Text("Last Expenses:")
                }
            }
            .safeAreaInset(edge: .bottom, spacing: 0, content: BottomButtons)
            .navigationTitle("Kunlik hisob")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.accentColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            path.append("settings")
                        }) {
                            Label("Settings", systemImage: "gear")
                                .foregroundStyle(.blue)
                        }

                        Button(action: {
                            path.append("edit")
                            

                        }) {
                            Label("Edit", systemImage: "pencil")
                                .foregroundStyle(.orange)
                        }

                        Button(role: .destructive, action: {
                            path.append("logout")

                        }) {
                            Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
                        }

                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.accentColor)
                    }
                }
                
            }
            .navigationDestination(for: String.self) { value in
                          switch value {
                          case "settings":
                              SettingsView()
                          case "edit":
                              EditView()
                          case "logout":
                              LoginView()
                          default:
                              Text("Not found")
                          }
                      }
            
        }
    }
    
    @ViewBuilder func BottomButtons() -> some View {
        HStack {
            NavigationLink {
                AddTransactionView(onComplete: viewModel.didUserCreatedTransaction)
            } label: {
                VStack {
                    Image(systemName: "minus.slash.plus")
                    Text("Harajat qo'shish")
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 18))
            }
            NavigationLink(destination: MonitoringView(viewModel: viewModel)) {
                VStack {
                    Image(systemName: "chart.pie.fill")
                    Text("Monitoring")
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 18))
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
