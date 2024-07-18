import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: FlashcardsViewModel
    @State private var selectedSet: FlashcardSet?
    @State private var showingAddSetSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.flashcardSets) { set in
                    NavigationLink(destination: FlashcardsView(flashcardSet: set)) {
                        Text(set.name)
                    }
                }
                .onDelete(perform: viewModel.deleteSet)
            }
            .navigationTitle("Flashcard Sets")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingAddSetSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddSetSheet) {
                AddSetView()
                    .environmentObject(viewModel)
            }
        }
    }
}
