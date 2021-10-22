import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case imagePicker
        case zoomableScrollView
    }
    
    @State private var currentTab = Tab.imagePicker
    
    var body: some View {
        TabView(selection: $currentTab) {
            ImagePickerView().tabItem {
                Label("Image Picker", systemImage: "photo.on.rectangle.angled")
            }
            .tag(Tab.imagePicker)
            
            ZoomableScrollViewExample().tabItem {
                Label("Zoomable View", systemImage: "plus.magnifyingglass")
            }
            .tag(Tab.zoomableScrollView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
