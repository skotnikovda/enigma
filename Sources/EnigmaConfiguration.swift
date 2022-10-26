import Foundation 

public struct EnigmaConfigurationSeeds: Decodable {
  public var fastRotor: UInt64 = 0
  public var middleRotor: UInt64 = 0
  public var slowRotor: UInt64 = 0
  public var reflector: UInt64 = 0
  public init() {}
}
