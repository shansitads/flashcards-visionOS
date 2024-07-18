import SwiftUI

class FlashcardsViewModel: ObservableObject {
    @Published var flashcardSets: [FlashcardSet] = []
    
    func addSet(name: String) {
        let newSet = FlashcardSet(name: name)
        flashcardSets.append(newSet)
    }
    
    func deleteSet(at offsets: IndexSet) {
        flashcardSets.remove(atOffsets: offsets)
    }
    
    func addCard(to flashcardSet: FlashcardSet, question: String, answer: String) {
        let newCard = Flashcard(question: question, answer: answer)
        flashcardSet.flashcards.append(newCard)
    }
    
    func deleteCard(at offsets: IndexSet, from flashcardSet: FlashcardSet) {
        flashcardSet.flashcards.remove(atOffsets: offsets)
    }
    
    func markAsCorrect(card: Flashcard, in flashcardSet: FlashcardSet) {
        card.isCorrect = true
    }
    
    func markForReviewAgain(card: Flashcard, in flashcardSet: FlashcardSet) {
        card.isCorrect = false
    }
}
