//
//  ContentView.swift
//  DoTryCatchBootCamp
//
//  Created by apple on 13/11/25.
//

import SwiftUI

class DoTryCatchViewModel: ObservableObject {
    @Published var title = "Hello"
    func fetchTitle() {
        
    }
}

struct ContentView: View {
    @StateObject private var viewModel: DoTryCatchViewModel = DoTryCatchViewModel()
    var body: some View {
        VStack {
            
            Text(viewModel.title)
                .frame(width: 300,height: 300)
                .background(.blue)
                .onTapGesture {
                    print("Clicked")
                    viewModel.fetchTitle()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
