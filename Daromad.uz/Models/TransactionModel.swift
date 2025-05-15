//
//  TransactionModel.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//

import Foundation

enum TransactionType: String, Codable, CaseIterable {
    case income = "Daromad"
    case expense = "Xarajat"
}

struct Transaction: Identifiable, Codable {
    var id = UUID()
    var amount: Double
    var category: String
    var description: String
    var date: Date
    var type: TransactionType
}


extension Transaction {
    static let example = Transaction(
        amount: 1000.0,
        category: "Food",
        description: "Groceries",
        date: Date(),
        type: .expense
    )
}
