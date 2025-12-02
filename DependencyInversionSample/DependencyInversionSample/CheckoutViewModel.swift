//
//  CheckoutViewModel.swift
//  DependencyInversionSample
//
//  Created by apple on 02/12/25.
//

import Foundation


protocol CartProtocol {
    var products:[String: Double]  { get set }
    func getPayableAmount() -> Double
}
class CheckoutViewModel: ObservableObject {
    var cart:CartProtocol
    
    init(cart: CartProtocol) {
        self.cart = cart
    }
    func makePayment() {
        print("Car Payment is done here at:\(cart.getPayableAmount())")
    }
    
}

class Cart: CartProtocol {
    var products:[String: Double] = ["Guitar":200.0,"Televison":100000]
    
    func getPayableAmount() -> Double {
        var payableAmount = 0.0
        for key in products.keys {
            payableAmount += products[key] ?? 0.0
        }
        return payableAmount
        
    }
}
