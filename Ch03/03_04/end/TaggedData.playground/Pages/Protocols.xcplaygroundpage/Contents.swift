/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 3.4 Redesigning Using Protocols

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

protocol Taggable {
    var tag: String { get set }
    var data: Data { get set }
    init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable {
    init(tag: String, contentsOf url: URL) throws
    func persist(to url: URL) throws
}

extension TaggedPersistable {
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol TaggedEncodable: Taggable {
    var base64Encoded: String { get }
}

extension TaggedEncodable {
    var base64Encoded: String {
        return data.base64EncodedString()
    }
}
    
/*
class MyTaggedData: TaggedData {
    var tag: String
    var data: Data
    
    required init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}*/

struct MyTaggedData: TaggedPersistable, TaggedEncodable {
    var tag: String
    var data: Data
}

let taggedData = MyTaggedData(tag: "42",
                              data: Data(repeating: 42, count: 1))

let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let url = documentsURL.appendingPathComponent("tagged")

try? taggedData.persist(to: url)

let str = taggedData.base64Encoded
