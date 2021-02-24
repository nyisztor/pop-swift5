/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.10 Solution: Removing Tight Coupling

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
class PaymentController {
    let services: [Service]
    
    init(services: [Service]) {
        self.services = services
    }
    
    func calculateEarnings() -> Float {
        services.reduce(0) { $0 + $1.total}
        
        var total: Float = 0
        services.forEach { (service) in
            total += service.total
        }
        return total //amazonService.earnings + eBayService.totalEarned
 
    }
}

var amazonService = make(service: .amazon) //AmazonService()
var etsyService = make(service: .etsy) //EtsyService()

let controller = PaymentController(services: [amazonService, etsyService])

amazonService.add(payment: 100) //amazonService.receive(payment: 100)
etsyService.add(payment: 25)//eBayService.add(earning: 25)
amazonService.add(payment: 12.50)//amazonService.receive(payment: 12.50)

print("Total earned: \(controller.calculateEarnings())")
