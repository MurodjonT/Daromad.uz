//
//  TransactionViewModel.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    init() {
        transactions = [
            Transaction(amount: 50000, category: "Ish haqi", description: "Oy oxiri", date: Date(), type: .income),
            Transaction(amount: 20000.43, category: "Oziq-ovqat", description: "Market", date: Date(), type: .expense),
            Transaction(amount: 50000, category: "Ish haqi", description: "Oy oxiri", date: Date(), type: .income),
            Transaction(amount: 20000.43, category: "Oziq-ovqat", description: "Market", date: Date(), type: .expense)
        ]
    }
    
    func didUserCreatedTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }
    
    func addTransaction(amount: Double, category: String, description: String, date: Date, type: TransactionType) {
        let newTransaction = Transaction(
            amount: amount,
            category: category,
            description: description,
            date: date,
            type: type
        )
        transactions.append(newTransaction)
    }

    var totalIncome: Double {
        transactions
            .filter { $0.type == .income }
            .map { $0.amount }
            .reduce(0, +)
    }
    
    var totalExpense: Double {
        transactions
            .filter { $0.type == .expense }
            .map { $0.amount }
            .reduce(0, +)
    }
    
    var balance: Double {
        totalIncome - totalExpense
    }
    
    func expenseByCategory() -> [String: Double] {
        var result: [String: Double] = [:]
        for transaction in transactions where transaction.type == .expense {
            result[transaction.category, default: 0] += transaction.amount
        }
        return result
    }
    
    func incomeByCategory() -> [String: Double] {
        var result: [String: Double] = [:]
        for transaction in transactions where transaction.type == .income {
            result[transaction.category, default: 0] += transaction.amount
        }
        return result
    }

}
