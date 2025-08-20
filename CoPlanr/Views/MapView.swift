//
//  MapView.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/10/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: String = ""
    var venue: String = ""
    var interactionMode: MapInteractionModes = .all
    
    //Default region is Times Square
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State private var position: MapCameraPosition = .automatic
    @State private var markerLocation = CLLocation()
    
    var body: some View {
        Map(position: $position, interactionModes: interactionMode) {
            Marker("", coordinate: markerLocation.coordinate)
                .tint(.red)
        }
        .task {
            convertAddress(location: location)
        }
        .onTapGesture {
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: markerLocation.coordinate.latitude, longitude: markerLocation.coordinate.longitude))
            
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = venue
            
            MKMapItem.openMaps(with: [mapItem])
        }
    }
    
    private func convertAddress(location: String) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: {placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            self.position = .region(region)
            self.markerLocation = location
            
        })
    }
}

#Preview {
    MapView(location: "5085 Westheimer Rd, Houston, TX 77056")
}

//Text address = placemark

