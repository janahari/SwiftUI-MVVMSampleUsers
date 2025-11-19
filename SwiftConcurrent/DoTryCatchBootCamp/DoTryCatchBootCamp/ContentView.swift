//
//  ContentView.swift
//  DoTryCatchBootCamp
//
//  Created by apple on 13/11/25.
//

import SwiftUI

class DoTryCatchDataManager {
    let isActive: Bool = false
    
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
    
    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    func getTitle4() throws -> String {
        if isActive {
            return "NEW TEXT from Title 4 "
        } else {
            throw URLError(.badServerResponse)
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
        /*
         let result = manager.getTitle2()
        switch result {
        case .success(let title):
            self.title = title
            self.title = title
        case .failure(let error):
            self.title = error.localizedDescription
         }
         */
        do {
            let newTitle = try manager.getTitle3()
            self.title = newTitle
            print("Setting the title 4 ")
            let finalTitle = try manager.getTitle4()
            self.title = finalTitle
/* We have used multiple throw functions if any function is caught exception  then it will return immediately and other functions will not execute */

        } catch let error {
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
