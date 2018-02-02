
protocol Extensible {
    
    associatedtype ExtensibleType
    
    static var ex: Extension<ExtensibleType>.Type { get }
    
    var ex: Extension<ExtensibleType> { get }
}

extension Extensible {
    
    public static var ex: Extension<Self>.Type {
            return Extension<Self>.self
    }
    
    public var ex: Extension<Self> {
        return Extension(self)
    }
}


public struct Extension<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

extension NSObject: Extensible {}
