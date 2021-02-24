/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 4.3 Working with Generic Types

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation
/*
struct StringWrapper {
    var storage: String
}

struct IntWrapper {
    var storage: Int
}

struct DateWrapper {
    var storage: Date
}*/

struct Wrapper<T: Equatable> {
    var storage: T
    init(_ value: T) {
        storage = value
    }
}

let piWrapped = Wrapper<Double>(Double.pi)
let piWrapped2 = Wrapper(Double.pi)
let stringWrapped = Wrapper("POP")
let dateWrapped = Wrapper(Date())
