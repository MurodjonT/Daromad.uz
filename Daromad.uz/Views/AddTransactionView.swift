import SwiftUI

struct AddTransactionView: View {

    @Environment(\.dismiss) var dismiss
    
    var onComplete: (Transaction) -> Void

    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    @State private var type: TransactionType = .expense

    var body: some View {
        List {
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
                    ForEach(TransactionType.allCases, id: \.self) { type in
                        Text(type.title).tag(type)
                    }
                }
            }

            Button {
                if let amount = Double(amount.replacingOccurrences(of: ",", with: ".")) {
                    onComplete(Transaction(amount: amount, category: category, description: description, date: date, type: type))
                    dismiss()
                } else {
                   print("asdkjfh")
                }
            } label: {
                Text("Save")
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
        }
        .navigationTitle("Tranzaksiya qo‘shish")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddTransactionView { transaction in }
    }
}
