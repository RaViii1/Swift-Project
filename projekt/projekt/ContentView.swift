import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                menuView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
