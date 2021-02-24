/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.8 Providing Default Behavior in Protocols

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

extension BinaryPersistable {
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol Base64Encodable: BinaryRepresentable {
    var base64: String { get }
}

extension Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

struct MyData: BinaryPersistable, Base64Encodable {
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData(\(tag))"
    }
}
/*
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
*/

struct PersistableData: BinaryPersistable {
    var tag: String
    var data: Data
}

let p = PersistableData(tag: "42", data: Data(repeating: 1, count: 10))
try? p.persist(to: <#T##URL#>)
