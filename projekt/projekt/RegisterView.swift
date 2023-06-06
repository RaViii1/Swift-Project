//
//  RegisterView.swift
//  projekt
//
//  Created by student on 06/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isPresentingLoginView = false

    var body: some View {
        VStack() {
            Text("Register")
                .font(.system(size: 48))
               
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Perform registration action here
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.green)
                    .cornerRadius(8.0)
            }
            
             // Replace NavigationLink with Button
             Button(action:{self.isPresentingLoginView.toggle()}){
                 Text("Do you have an account? Login here.")
                     .foregroundColor(Color.blue)
              }
             
         }
           .fullScreenCover(isPresented:$isPresentingLoginView){
               LoginView()
           }
         .padding()
     }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
