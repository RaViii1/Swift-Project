
import SwiftUI
import MapKit
struct Place: Identifiable{
    let id = UUID()
    let name: String
    var coordinate: CLLocationCoordinate2D
}
struct MapView: View {
    let place = [Place(name: "Kantor", coordinate: CLLocationCoordinate2D(latitude: 51.2427662, longitude: 22.5061243))]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.2427662, longitude: 22.5061243), latitudinalMeters: 500, longitudinalMeters: 500)
    
    var body: some View {
        VStack {
            Text("Nasz adres:")
                .font(.title)
                .padding(.bottom, 8)
            Text("Lublin 20-718 ul. Aleja Krasnicka 27")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            Text("Kontakt:")
            Text("+48 536 992 131")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            Text("fancykantor@gmail.com")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 16);            Map(coordinateRegion: $region, annotationItems: place) { place in
                    MapMarker(coordinate: place.coordinate, tint: Color.red)
                }
                .frame(width: 350, height: 470)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding()
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
