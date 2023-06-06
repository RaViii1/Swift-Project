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

    var body: some View {
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
        }
        .padding()
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
