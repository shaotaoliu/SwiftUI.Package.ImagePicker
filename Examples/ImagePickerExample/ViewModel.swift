import SwiftUI
import ImagePicker

class ViewModel: ObservableObject {
    
    @Published var showCameraSheet = false
    @Published var selectedImage: UIImage? = nil
    @Published var sourceType = ImagePicker.SourceType.library
    
    @Published var hasError: Bool = false
    @Published var error: String? {
        didSet {
            hasError = error != nil
        }
    }
    
    init() {}
    
    func showImagePicker(sourceType: ImagePicker.SourceType) {
        if sourceType == .camera {
            do {
                try ImagePicker.checkCameraStatus()
            }
            catch {
                self.error = error.localizedDescription
                return
            }
        }
        
        self.sourceType = sourceType
        self.showCameraSheet = true
    }
}
