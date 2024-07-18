import SwiftUI

struct ReviewView: View {
    @EnvironmentObject var viewModel: FlashcardsViewModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var flashcardSet: FlashcardSet
    @State private var currentCardIndex = 0
    @State private var showAnswer = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
            Spacer()
            if currentCardIndex < flashcardSet.flashcards.count {
                let card = flashcardSet.flashcards[currentCardIndex]
                VStack {
                    Text(card.question)
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .onTapGesture {
                            showAnswer.toggle()
                        }
                    if showAnswer {
                        Text(card.answer)
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button("Correct") {
                            viewModel.markAsCorrect(card: card, in: flashcardSet)
                            nextCard()
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                        Button("Review Again") {
                            viewModel.markForReviewAgain(card: card, in: flashcardSet)
                            nextCard()
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            } else {
                Text("You've reviewed all cards!")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            Spacer()
        }
        .onAppear {
            currentCardIndex = 0
            showAnswer = false
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    private func nextCard() {
        showAnswer = false
        currentCardIndex += 1
    }
}
