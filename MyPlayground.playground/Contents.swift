import UIKit

var greeting = "Hello, playground"


struct Message {
  let text:String
  let timestamp: Date
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd HH:mm"
 
let messages = [
    Message(text: "Hello", timestamp: formatter.date(from: "2025/11/06 09:00")!),
    Message(text: "How are you?", timestamp: formatter.date(from: "2025/11/05 10:00")!),
    Message(text: "Good morning", timestamp: formatter.date(from: "2025/11/06 08:30")!),
    Message(text: "See you", timestamp: formatter.date(from: "2025/11/05 18:00")!)
]


//Dict wiht key Date and value is text
//let dict = Dictionary(messages).map { $0 }
var resultDict: [Date:[String]] = [:]
for val in messages {
    //Convert timestamp to Data
   
   // var arrMessage = result[dateVal] ?? [""]
    
    print(dateVal)
    
    
    
}
//print(resultDict)
