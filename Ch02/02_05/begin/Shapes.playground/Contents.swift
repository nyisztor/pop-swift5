/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.5 Understanding Polymorphism

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
import Foundation

protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double
    var area: Double { side * side }
}

struct Rectangle: Shape {
    let height: Double
    let width: Double
    var area: Double { width * height }
}

struct Rhombus: Shape {
    let p: Double
    let q: Double
    var area: Double { (p * q) / 2 }
}

struct Circle: Shape {
    let radius: Double
    // A = π * r^2
    var area: Double { .pi * radius * radius }
}
