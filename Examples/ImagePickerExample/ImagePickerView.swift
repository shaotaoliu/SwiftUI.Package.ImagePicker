import SwiftUI
import ImagePicker

struct ImagePickerView: View {
    
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.selectedImage {
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .frame(maxHeight: 300)
                }
                else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        vm.showImagePicker(sourceType: .camera)
                    }, label: {
                        ImageLable(title: "Camera", systemImage: "camera")
                    })
                    
                    Button(action: {
                        vm.showImagePicker(sourceType: .library)
                    }, label: {
                        ImageLable(title: "Photos", systemImage: "photo")
                    })
                }
                .sheet(isPresented: $vm.showCameraSheet) {
                    ImagePicker(sourceType: vm.sourceType, selectedImage: $vm.selectedImage)
                        .ignoresSafeArea()
                }
                .alert("Error", isPresented: $vm.hasError, presenting: vm.error, actions: { error in
                    
                }, message: { error in
                    Text(error)
                })
                
                Spacer()
            }
        }
    }
}

struct ImageLable: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        Label(title, systemImage: systemImage)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.blue)
            .cornerRadius(10)
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
