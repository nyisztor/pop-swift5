/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.7 Protocol Composition

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

protocol BinaryRepresentable {
    var tag: String { get set }
    var data: Data { get }
    init(tag: String, data: Data)
}

protocol BinaryPersistable: BinaryRepresentable /*, CustomStringConvertible, Equatable*/{
    init(tag: String, contentsOf url: URL) throws
    func persist(to url: URL) throws
}

protocol Base64Encodable: BinaryRepresentable {
    var base64: String { get }
}

struct MyData: BinaryRepresentable/*BinaryPersistable, Base64Encodable, CustomStringConvertible*/ {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    /*
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    var base64: String {
        return self.data.base64EncodedString()
    }
    
    var description: String {
        return "MyData(\(tag))"
    }*/
}

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData(\(tag))"
    }
}

extension MyData: Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

extension MyData: BinaryPersistable {
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}
