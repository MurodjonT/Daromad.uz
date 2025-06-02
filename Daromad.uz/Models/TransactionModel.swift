//
//  TransactionModel.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 15/05/25.
//

import SwiftUI

enum TransactionType: String, Codable, CaseIterable {
    
    case income
    case expense
    
    
    var title: LocalizedStringKey {
        switch self {
        case .income: return "Daromad"
        case .expense: return "Xarajat"
        }
    }
    
    var color: Color {
        switch self {
        case .income: return .green
        case .expense: return .red
        }
    }
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

 
enum Language: String, CaseIterable, Identifiable {
    case uzbek = "Uzbek"
    case english = "English"
    case russian = "Russian"
    
    var id: String { self.rawValue }
    
//    var title: LocalizedStringKey {
//        switch self {
//        case .uzbek: return "Uzbek"
//        case .english: return "English"
//        case .russian: return "Russian"
//        }
//    }
}
