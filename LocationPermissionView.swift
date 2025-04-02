import SwiftUI

struct LocationPermissionView: View {
    var userName: String
    @StateObject private var locationManager = LocationManager()
    
    @State private var isSafetyAlertActive = false
    
    var body: some View {
        VStack {
            Text("Hello, \(userName)!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("To use PedAlert, we need access to your location.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                locationManager.requestLocationPermission()
            }) {
                Text("Allow Location Access")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            NavigationLink(destination: SafetyAlertView(), isActive: $isSafetyAlertActive) {
                EmptyView()
            }
        }
        .padding()
        .onChange(of: locationManager.permissionStatus) { status in
            if status == .authorizedWhenInUse {
                isSafetyAlertActive = true
            }
        }
    }
}
