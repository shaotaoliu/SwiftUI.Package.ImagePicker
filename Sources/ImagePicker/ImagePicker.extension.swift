import SwiftUI
import AVFoundation

extension ImagePicker {
    
    static func checkCameraStatus() throws {
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            throw ImagePickerError.unavailable
        }
        
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        switch authStatus {
        case .denied:
            throw ImagePickerError.denied
            
        case .restricted:
            throw ImagePickerError.restricted
            
        default:
            break
        }
    }
}

public enum ImagePickerError: Error, LocalizedError {
    
    case unavailable
    case restricted
    case denied
    
    public var errorDescription: String? {
        switch self {
        case .unavailable:
            return NSLocalizedString("Camera is not available on this device", comment: "")
            
        case .restricted:
            return NSLocalizedString("You are not allowed to access media capture devices.", comment: "")
            
        case .denied:
            return NSLocalizedString("You are denied for media capture.", comment: "")
        }
    }
}
