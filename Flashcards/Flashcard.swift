import Foundation

class Flashcard: ObservableObject, Identifiable {
    var id = UUID()
    @Published var question: String
    @Published var answer: String
    @Published var isCorrect: Bool
    
    init(question: String, answer: String, isCorrect: Bool = false) {
        self.question = question
        self.answer = answer
        self.isCorrect = isCorrect
    }
}
