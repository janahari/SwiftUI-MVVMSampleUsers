//
//  ContentView.swift
//  DependencyInversionSample
//
//  Created by apple on 02/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CheckoutViewModel(cart: Cart())

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("\(viewModel.cart.getPayableAmount())")
            
        }
        .padding()
        .onAppear{
            viewModel.makePayment()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
