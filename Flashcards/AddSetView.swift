import SwiftUI

struct AddSetView: View {
    @EnvironmentObject var viewModel: FlashcardsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var setName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Set Name")) {
                    TextField("Enter set name", text: $setName)
                }
            }
            .navigationTitle("New Flashcard Set")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        viewModel.addSet(name: setName)
                        dismiss()
                    }
                    .disabled(setName.isEmpty)
                }
            }
        }
    }
}
