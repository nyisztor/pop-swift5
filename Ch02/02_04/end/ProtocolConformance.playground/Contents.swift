/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.4 Adopting Protocols through Extensions

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

protocol Encrypting {
    func xor(key: UInt8) -> Self?
}

struct TaggedData: Encrypting {
    func xor(key: UInt8) -> TaggedData? {
        return nil
    }
}

extension String: Encrypting {
    func xor(key: UInt8) -> String? {
        String(bytes: self.utf8.map { $0 ^ key}, encoding: .utf8)
    }
}

let source = "Hello, Protocol!"
let target = source.xor(key: 42)

print(target ?? "Failed to encode")
print(target?.xor(key: 42) ?? "Failed to decode.")
