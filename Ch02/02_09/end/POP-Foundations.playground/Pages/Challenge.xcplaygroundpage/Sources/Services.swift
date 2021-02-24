import Foundation

public class AmazonService {
    private var balance: Float = 0
    
    public init() {}
    
    public func orderPlaced(payment: Float) {
        balance += payment
    }
    
    public var earnings: Float { balance }
}

public class EtsyService {
    private var earnings: Float = 0
    
    public init() {}
    
    public func itemSold(profit: Float) {
        earnings += profit
    }
    
    public var totalSold: Float { earnings }
}
