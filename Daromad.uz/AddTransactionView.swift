//
//  Untitled.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
    @Environment(\.dismiss) var dismiss

    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    @State private var type: TransactionType = .expense

    var body: some View {
        Form {
            Section(header: Text("Summasi")) {
                TextField("10000", text: $amount)
                    .keyboardType(.decimalPad)
            }

            Section(header: Text("Kategoriya")) {
                TextField("Masalan: Oziq-ovqat", text: $category)
            }

            Section(header: Text("Izoh")) {
                TextField("Izoh yozing", text: $description)
            }

            Section(header: Text("Sana")) {
                DatePicker("Sana", selection: $date, displayedComponents: .date)
            }

            Section(header: Text("Turi")) {
                Picker("Turi", selection: $type) {
                    Text("Daromad").tag(TransactionType.income)
                    Text("Xarajat").tag(TransactionType.expense)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Button("Saqlash") {
                if let amountValue = Double(amount) {
                    viewModel.addTransaction(
                        amount: amountValue,
                        category: category,
                        description: description,
                        date: date,
                        type: type
                    )
                    dismiss()
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("Tranzaksiya qo‘shish")
    }
}
