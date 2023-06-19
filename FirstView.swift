//
//  FirstView.swift
//  projekt
//
//  Created by student on 06/06/2023.
//

import SwiftUI
struct KantorView: View {
//let currencies = ["PLN", "USD", "EUR", "GBP"]

@State private var selectedCurrencyIn = "PLN"
@State private var selectedCurrencyOut = "USD"
@State private var inputValue = ""

/*init(selectedCurrencyIn: String, selectedCurrencyOut: String) {
    self._selectedCurrencyIn = State(initialValue: selectedCurrencyIn)
    self._selectedCurrencyOut = State(initialValue: selectedCurrencyOut)
 }*/

 private var convertedValue: Double {
     guard let amount = Double(inputValue) else { return 0 }
    
     switch (selectedCurrencyIn, selectedCurrencyOut) {
     case ("PLN", "PLN"):
         return amount / 1
         case ("PLN", "USD"):
             return amount / 3.8
         case ("PLN", "EUR"):
             return amount / 4.5
         case ("PLN", "GBP"):
             return amount / 5.2
         case ("USD","PLN"):
            return amount * 3.8
        case("EUR","PLN"):
            return amount * 4.5
        case("GBP","PLN"):
            return amount * 5.2
        default:
             fatalError("Unsupported currency")
      }
  }

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Currency.name, ascending: true)],
        animation: .default)
    private var currencies: FetchedResults<Currency>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PairValue.buy_curr.name, ascending: true)],
        animation: .default)
    private var pairs: FetchedResults<PairValue>
    
  var body: some View {
      
      
      VStack(spacing: 20) {
          Text("Enter amount").font(.title)
          TextField("Enter value", text: $inputValue)
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .keyboardType(.decimalPad)
              .font(.title2)

          Text("Select Currency In")
          Picker(selection: $selectedCurrencyIn, label: Text("Select Currency In")) {
              ForEach(currencies, id:\.self) { currency in
                  Text(currency.name!)
                      .tag(currency.name)
              }
          }
          .pickerStyle(SegmentedPickerStyle())
          Text("Select Currency Out")
          Picker(selection: $selectedCurrencyOut, label: Text("Select Currency Out")) {
              ForEach(currencies, id:\.self) { currency in
                  Text(currency.name!)
                      .tag(currency.name)
              }
          }
          .pickerStyle(SegmentedPickerStyle())

          Spacer()

         Text("\(convertedValue, specifier:"%.2f") \(selectedCurrencyOut)")
              .font(.system(size: 48))

         Spacer()
     }.padding()
  }
}
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        KantorView()
    }
}
