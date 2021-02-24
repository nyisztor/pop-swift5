import Foundation

private class AmazonService {
    private var balance: Float = 0
    
    fileprivate init() {}
    
    private func orderPlaced(payment: Float) {
        balance += payment
    }
    
    private var earnings: Float { balance }
}

private class EtsyService {
    private var earnings: Float = 0
    
    fileprivate init() {}
    
    private func itemSold(profit: Float) {
        earnings += profit
    }
    
    private var totalSold: Float { earnings }
}

public protocol Service {
    var total: Float {get}
    mutating func add(payment: Float)
}

extension AmazonService: Service {
    public var total: Float { earnings }
    
    public func add(payment: Float) {
        orderPlaced(payment: payment)
    }
}

extension EtsyService: Service {
    public var total: Float { totalSold }
    
    public func add(payment: Float) {
        itemSold(profit: payment)
    }
}

public enum ServiceType {
    case amazon
    case etsy
}

public func make(service: ServiceType) -> Service {
    switch service {
    case .amazon:
        return AmazonService()
    case .etsy:
        return EtsyService()
    }
}
