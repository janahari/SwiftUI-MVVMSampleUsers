//
//  DownloadImageAsync.swift
//  DoTryCatchBootCamp
//
//  Created by apple on 20/11/25.
//

import SwiftUI

class DonwloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    func fetchImage() {
        self.image = UIImage(systemName: "heart.fill")
    }
    
}
struct DownloadImageAsync: View {
    @StateObject private var viewModel = DonwloadImageAsyncViewModel()
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height: 100)
            }
        }
        .onAppear{
            viewModel.fetchImage()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
