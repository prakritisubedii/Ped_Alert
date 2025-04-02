import SwiftUI

struct SafetyAlertView: View {
    var body: some View {
        VStack {
            Text("Safety Alert")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Please stay alert while walking and avoid using your phone at intersections.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .padding()
            
            Button(action: {
                // Future: Trigger safety alerts here
            }) {
                Text("Got it")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

