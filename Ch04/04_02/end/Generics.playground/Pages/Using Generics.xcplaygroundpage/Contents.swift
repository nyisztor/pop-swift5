/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 4.2 Defining Generic Functions and Methods

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

equals(lhs: "abcd", rhs: "dcba")

equals(lhs: Double.pi, rhs: 3.14)

let d1 = Data(repeating: 1, count: 10)
let d2 = Data(repeating: 1, count: 10)

equals(lhs: d1, rhs: d2)
