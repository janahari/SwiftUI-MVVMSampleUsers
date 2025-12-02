import UIKit
import Combine
var greeting = "Hello, playground"
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


var globalCancellables = Set<AnyCancellable>()


class UserData: ObservableObject {
    
    @Published var users:[Int]? = nil
    var cancellable = Set<AnyCancellable>()
    
    func fetchUserDetail(_ urlString: String) {
        guard let url = URL(string: urlString) else {
           // throw URLError(.badURL)
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [Int].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { _ in
               // print("Sink completionHandler")
            } receiveValue: { [weak self] values in
                self?.users = values
              //  print("The geeting val:\(self?.users ?? [1,2,3])")
            }
            .store(in: &cancellable)
        
    }
    
    func fetchData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let decodedObject = try decoder.decode([Int].self, from: data)
        print(decodedObject)

        print(data)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return data
    }
    

}
let service = UserData()
service.$users
    .compactMap({$0})
    .sink { values in
        print("Recieved Values:\(values)")
    }
    .store(in: &globalCancellables)
Task {
   
    service.fetchUserDetail("https://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=5")
}



