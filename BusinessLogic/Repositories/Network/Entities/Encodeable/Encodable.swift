

protocol Identifiable {
    var uid: String { get }
}

typealias DomainConvertibleCoding = DomainConvertibleType

protocol Encodable {
  
    associatedtype Encoder: DomainConvertibleCoding
    
    var encoder: Encoder { get }
}
