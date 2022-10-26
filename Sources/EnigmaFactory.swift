public struct EnigmaFactory {
  private static func createRotor<A: Alphabet>(
    with alphabet: A,
    from seed: UInt64
  ) -> Rotor<A> {
    let permutation = Permutation(of: alphabet, with: seed)
    let rotor = Rotor(with: permutation)
    return rotor
  }
  private static func createReflector<A: Alphabet>(
    with alphabet: A,
    from seed: UInt64
  ) -> Reflector<A> {
    let permutation = Permutation(of: alphabet, with: seed)
    let reflector = Reflector(with: permutation)
    return reflector
  }
  public static func create<A: Alphabet>(
    with alphabet: A,
    from seeds: EnigmaConfigurationSeeds
  ) -> Enigma<A> {
    let fastRotor = self.createRotor(with: alphabet, from: seeds.fastRotor)
    let middleRotor = self.createRotor(with: alphabet, from: seeds.middleRotor)
    let slowRotor = self.createRotor(with: alphabet, from: seeds.slowRotor)
    let reflector = self.createReflector(with: alphabet, from: seeds.reflector)
    let enigma = Enigma(
      fastRotor: fastRotor,
      middleRotor: middleRotor,
      slowRotor: slowRotor,
      reflector: reflector
    )
    return enigma
  }
}
