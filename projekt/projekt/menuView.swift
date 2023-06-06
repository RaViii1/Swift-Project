//
//  menuView.swift
//  projekt
//
//  Created by student on 06/06/2023.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationView {
            VStack{
                ZStack(alignment: .center) {
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("FancyKantor")
                                .foregroundColor(.white)
                                .font(.title)
                                // Center text
                                .multilineTextAlignment(.center)
                                // Capitalize all letters
                                .textCase(.uppercase)
                            
                            
                        }
                        Spacer()
                    }
                    // Add background color with opacity
                    .background(Color.black.opacity(0.5))
                }
                List {
                    Text("FancyKantor")
                        .textCase(.uppercase)
                        .multilineTextAlignment(.center)
                    NavigationLink(destination:  KantorView(selectedCurrencyIn: "PLN", selectedCurrencyOut: "USD")) {
                        Text("Currency exchange")
                    }
                    NavigationLink(destination: MapView()) {
                        Text("Map")
                    }
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                    }
                }
                .navigationBarTitle(Text("Home Page"))
                Spacer()
            }
            
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
