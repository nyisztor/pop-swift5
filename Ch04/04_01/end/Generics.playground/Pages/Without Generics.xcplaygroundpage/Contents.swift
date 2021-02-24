/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 4.1 The Importance of Generics

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

func equals(lhs: Int, rhs: Int) -> Bool {
    // The iplementation is straightforward
    return lhs == rhs
}

print(equals(lhs: 3, rhs: 4))
//print(equals(lhs: 1.4, rhs: 1.5)) // error!

func equals(lhs: Double, rhs: Double) -> Bool {
    return lhs == rhs
}

// Works with double types
equals(lhs: 2, rhs: 3.1)

let pi: Float = 3.14
let e: Float = 2.71
// print(equals(lhs: pi, rhs: e)) // error!

func equals(lhs: Float, rhs: Float) -> Bool {
    return lhs == rhs
}

equals(lhs: pi, rhs: e)
