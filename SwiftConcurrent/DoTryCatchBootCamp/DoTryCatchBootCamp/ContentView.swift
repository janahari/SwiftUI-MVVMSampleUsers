//
//  ContentView.swift
//  DoTryCatchBootCamp
//
//  Created by apple on 13/11/25.
//

import SwiftUI

class DoTryCatchDataManager {
    let isActive: Bool = true
    func getTitle() -> (title: String?, error: Error?) {
        if false {
        return ("NEW TEXT", nil)
        } else {
            return (nil,URLError(URLError.badURL))
        }
    }
    func getTitle2() -> Result<String, Error> {
        if !isActive {
            return .success("New Text")
        } else {
            return .failure(URLError(URLError.badURL))
        }
        
    }
}

class DoTryCatchViewModel: ObservableObject {
    @Published var title = "Hello"
    let manager = DoTryCatchDataManager()
    func fetchTitle() {/*
        let returnedData = manager.getTitle()
        if let title = returnedData.title {
            self.title = title
        } else if let error = returnedData.error {
            self.title = error.localizedDescription
        }
                        */
        let result = manager.getTitle2()
        switch result {
        case .success(let title):
            self.title = title
        case .failure(let error):
            self.title = error.localizedDescription
        }
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
