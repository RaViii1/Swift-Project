//
//  ThirdView.swift
//  projekt
//
//  Created by student on 06/06/2023.
//

import SwiftUI
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isPresentingRegisterView = false

    var body: some View {
        NavigationView { // Embed everything in a navigation view
            VStack() {
                Text("Login")
                    .font(.system(size: 48))
                   
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    // Perform login action here
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .cornerRadius(8.0)

                 }
                
                 // Replace NavigationLink with Button
                 Button(action: { self.isPresentingRegisterView.toggle() }) {
                     Text("Don't have an account? Register here.")
                         .foregroundColor(Color.blue)
                  }
            }

           .fullScreenCover(isPresented:$isPresentingRegisterView){
               RegisterView()
           }
            .padding()
       }
   }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
