import SwiftUI
import ImagePicker

struct ZoomableScrollViewExample: View {
    var body: some View {
        ZoomableScrollView {
            Image("yellowstone")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 300)
                .border(.blue, width: 3)
                .clipped()
        }
    }
}

struct ZoomableScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ZoomableScrollViewExample()
    }
}
