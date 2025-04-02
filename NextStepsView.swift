import SwiftUI

struct NextStepsView: View {
    @State private var isNextScreenActive = false
    
    var body: some View {
        VStack {
            Text("You're All Set!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("PedAlert is now ready to assist you in real time.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(destination: ContentView(), isActive: $isNextScreenActive) {
                Button(action: {
                    // Navigate to the next step or home screen
                    isNextScreenActive = true
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
}
