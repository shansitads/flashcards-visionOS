import Foundation

class FlashcardSet: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String
    @Published var flashcards: [Flashcard]
    
    init(name: String) {
        self.name = name
        self.flashcards = []
    }
}
