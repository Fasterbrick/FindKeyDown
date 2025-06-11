import SwiftUI
import Cocoa

// ViewModel to hold the key information
class KeyPressViewModel: ObservableObject {
    @Published var keyPressed: String = "None"
}

// Custom NSView that listens for key presses
struct KeyEventListener: NSViewRepresentable {
    @ObservedObject var viewModel: KeyPressViewModel
    
    func makeNSView(context: Context) -> NSView {
        // Create an NSView to capture key events
        let view = NSView()
        
        // Add the key event listener
        let keyListener = KeyListener(viewModel: viewModel)
        view.addSubview(keyListener)
        keyListener.frame = view.bounds
        keyListener.autoresizingMask = [.width, .height]
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        // No update necessary, since it's just listening for key events
    }
}

// The custom NSView that handles key down events
class KeyListener: NSView {
    var viewModel: KeyPressViewModel
    
    init(viewModel: KeyPressViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        self.window?.makeFirstResponder(self)
    }
    
    override func keyDown(with event: NSEvent) {
        // Capture the key code that was pressed
        let keyCode = event.keyCode
        print("Key code pressed: \(keyCode)")
        
        // Update the ViewModel with the pressed key code as a string
        viewModel.keyPressed = "Key code: \(keyCode)"
    }
}
