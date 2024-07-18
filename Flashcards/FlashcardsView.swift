import SwiftUI

struct FlashcardsView: View {
    @EnvironmentObject var viewModel: FlashcardsViewModel
    @ObservedObject var flashcardSet: FlashcardSet
    @State private var showingAddCardSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach(flashcardSet.flashcards) { card in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(card.question)
                            Text(card.answer)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            viewModel.markAsCorrect(card: card, in: flashcardSet)
                        }) {
                            Image(systemName: "checkmark.circle")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Button(action: {
                            viewModel.markForReviewAgain(card: card, in: flashcardSet)
                        }) {
                            Image(systemName: "arrow.uturn.left.circle")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteCard(at: indexSet, from: flashcardSet)
                }
            }
            .navigationTitle(flashcardSet.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddCardSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCardSheet) {
                AddCardView(flashcardSet: flashcardSet)
                    .environmentObject(viewModel)
            }
        }
    }
}
