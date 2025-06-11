import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = KeyPressViewModel()
    var body: some View {
        VStack {
            // Display the key code of the pressed key
            Text("Key Pressed: \(viewModel.keyPressed)")
                .font(.title2)
            KeyEventListener(viewModel: viewModel)
        }
    }
}

