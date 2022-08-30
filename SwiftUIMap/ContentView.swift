//
//  ContentView.swift
//  SwiftUIMap
//
//  Created by Ryo on 2022/08/29.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @State private var region = MKCoordinateRegion()
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("経度\(region.center.longitude)")
            Text("緯度\(region.center.latitude)")
            
            Spacer()
            
            Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, userTrackingMode: $userTrackingMode)

                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                .mask(
                    Image("HalfCircle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
               
        }
        .ignoresSafeArea()
        .onAppear(){
            //位置報許可
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
