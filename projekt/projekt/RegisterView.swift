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

    var body: some View {
        VStack() {
            Text("Register")
                .font(.system(size: 48))
               
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Perform login action here
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.green)
                    .cornerRadius(8.0)
            }
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
