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
        ZStack {


            Form {
                Section(header: Text("Summasi")) {
                    TextField("10000", text: $amount)
                        .keyboardType(.decimalPad)
//                        .clipsShape(RoundedRectangle(cornerRadius: 12))
                }
                .listRowBackground(Color(.systemGray6))

                Section(header: Text("Kategoriya")) {
                    TextField("Masalan: Oziq-ovqat", text: $category)
                }
                .listRowBackground(Color(.systemGray6))

                Section(header: Text("Izoh")) {
                    TextField("Izoh yozing", text: $description)
                }
                .listRowBackground(Color(.systemGray6))

                Section(header: Text("Sana")) {
                    DatePicker("Sana", selection: $date, displayedComponents: .date)
                }
                .listRowBackground(Color(.systemGray6))

                Section(header: Text("Turi")) {
                    Picker("Turi", selection: $type) {
                        Text("Daromad").tag(TransactionType.income)
                        Text("Xarajat").tag(TransactionType.expense)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .listRowBackground(Color(.systemGray6))

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
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color(.systemBlue)) // tugma ham xuddi shunday fon bilan
            }
//            .clipsShape(RoundedRectangle(cornerRadius: 12)) // Formning burchaklarini yumshatamiz
            .scrollContentBackground(.hidden) // Form default backgroundni olib tashlaymiz
        }
        .navigationTitle("Tranzaksiya qo‘shish")
    }
}

#Preview {
    AddTransactionView(viewModel: TransactionViewModel())
}
