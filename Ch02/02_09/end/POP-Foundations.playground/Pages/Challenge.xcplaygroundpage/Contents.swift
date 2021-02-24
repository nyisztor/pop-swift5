/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 2.9 Challenge: Removing Tight Coupling

 **You can get the book on **[Amazon](https://www.amazon.com/dp/B08N1MKHPT)**.**
* * * * *

 My other programming books are available on [Amazon](amazon.com/author/nyisztor) and [iTunes](https://itunes.apple.com/us/author/karoly-nyisztor/id1345964804?mt=11).

 You can find my programming courses on [Udemy](https://www.udemy.com/user/karolynyisztor), [LinkedIn Learning](https://www.linkedin.com/learning/instructors/karoly-nyisztor) and [Pluralsight](https://www.pluralsight.com/profile/author/karoly-nyisztor).
 
 Useful links: [Youtube](https://www.youtube.com/c/swiftprogrammingtutorials) | [Website](http://www.leakka.com) | [Github](https://github.com/nyisztor) | [LinkedIn](https://www.linkedin.com/in/nykaroly/) | [Twitter](https://twitter.com/knyisztor)
 
 * * * * *
 */
class PaymentController {
    let amazonService: AmazonService
    let etsyService: EtsyService
    
    init(amazon: AmazonService, etsy: EtsyService) {
        amazonService = amazon
        etsyService = etsy
    }
    
    func calculateEarnings() -> Float {
        amazonService.earnings + etsyService.totalSold
    }
}

let amazonService = AmazonService()
let etsyService = EtsyService()

let controller = PaymentController(amazon: amazonService, etsy: etsyService)

amazonService.orderPlaced(payment: 100)
etsyService.itemSold(profit: 25)
amazonService.orderPlaced(payment: 12.50)

print("Total earned: \(controller.calculateEarnings())")
