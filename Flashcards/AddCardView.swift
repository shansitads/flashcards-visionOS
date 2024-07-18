import SwiftUI

struct AddCardView: View {
    @EnvironmentObject var viewModel: FlashcardsViewModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var flashcardSet: FlashcardSet
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Question")) {
                    TextField("Enter question", text: $question)
                }
                Section(header: Text("Answer")) {
                    TextField("Enter answer", text: $answer)
                }
            }
            .navigationTitle("New Flashcard")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        viewModel.addCard(to: flashcardSet, question: question, answer: answer)
                        dismiss()
                    }
                    .disabled(question.isEmpty || answer.isEmpty)
                }
            }
        }
    }
}
