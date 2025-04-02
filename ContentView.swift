import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var isNextScreenActive = false
    @FocusState private var isTextFieldFocused: Bool  
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to PedAlert")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("Please enter your name to continue:")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                TextField("Your Name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .focused($isTextFieldFocused)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    if !userName.isEmpty {
                        saveUserName()
                        isNextScreenActive = true
                    }
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(userName.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(userName.isEmpty)
                .padding()
                
                NavigationLink(destination: LocationPermissionView(userName: userName), isActive: $isNextScreenActive) {
                    EmptyView()
                }
            }
            .padding()
            .onAppear {
                isTextFieldFocused = true
            }
        }
    }
    
    func saveUserName() {
        UserDefaults.standard.set(userName, forKey: "UserName")
    }
}
