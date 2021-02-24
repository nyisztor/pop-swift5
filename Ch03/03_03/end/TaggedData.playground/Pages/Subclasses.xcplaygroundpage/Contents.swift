/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 3.3 Subclassing for a Modular Design

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

//: The subclass approach
class TaggedData {
    var tag: String
    var data: Data
        
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

class PersistentTaggedData: TaggedData {
    // persistence
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    convenience init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

class TaggedDataWithEncoding: TaggedData {
    // encoding
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}

let taggedData = TaggedData(tag: "first",
                            data: Data(repeating: 0, count: 1))
print("\(taggedData.tag), \(taggedData.data)")
