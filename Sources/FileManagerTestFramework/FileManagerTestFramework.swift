import Foundation

public final class TestObject {
    
    internal(set) public var message: String
    
    public init() {
        
        let defaultMessage = "Hello, World"
        
        #if DEBUG
        // For development phase if needs to customize values frequently
        do {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileURL = documentURL.appendingPathComponent("String.txt")
            let file = try String(contentsOf: fileURL)
            self.message = file
        } catch {
            debugPrint("Document URL not exist")
            self.message = defaultMessage
        }
        
        #else
        // For production phase
        message = defaultMessage
        #endif
    }
    
}
