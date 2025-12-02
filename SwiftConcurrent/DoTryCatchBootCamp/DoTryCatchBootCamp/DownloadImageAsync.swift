//
//  DownloadImageAsync.swift
//  DoTryCatchBootCamp
//
//  Created by apple on 20/11/25.
//

import SwiftUI

class DownloadAsyncImageLoader {
    
    let imageUrl: String =  "https://picsum.photos/200"
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage?
     {
         guard
             let data = data, let image = UIImage(data: data),
             let response = response as? HTTPURLResponse,
             response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
         }
         return image
     }
    func downloadImageWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        guard let url = URL(string: imageUrl) else { return }
       let request = URLRequest(url: url)
      
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
           
            let image = self?.handleResponse(data: data, response: response)
            completionHandler(image,error)
        }.resume()
    }
    
    
    
}

@MainActor
class DonwloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = DownloadAsyncImageLoader()
    func fetchImage() {
        loader.downloadImageWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
           
        }
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
