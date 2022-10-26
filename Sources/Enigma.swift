public struct Enigma<A: Alphabet> {
  private var fastRotor: Rotor<A>
  private var middleRotor: Rotor<A>
  private var slowRotor: Rotor<A>
  private let reflector: Reflector<A>
  public mutating func encrypt(letter oldLetter: A.LetterType) -> A.LetterType {
    self.onEncrypt()
    var letter = oldLetter
    letter = self.fastRotor.forward(letter: letter)
    letter = self.middleRotor.forward(letter: letter)
    letter = self.slowRotor.forward(letter: letter)
    letter = self.reflector.reflect(letter: letter)
    letter = self.slowRotor.backward(letter: letter)
    letter = self.middleRotor.backward(letter: letter)
    letter = self.fastRotor.backward(letter: letter)
    return letter
  }
  mutating func onEncrypt() {
    self.fastRotor.rotate()
    if self.fastRotor.position == 0 {
      self.middleRotor.rotate()
      if self.middleRotor.position == 0 {
        self.slowRotor.rotate()
      }
    }
  }
  public init(
    fastRotor: Rotor<A>,
    middleRotor: Rotor<A>,
    slowRotor: Rotor<A>,
    reflector: Reflector<A>
  ) {
    self.fastRotor = fastRotor
    self.middleRotor = middleRotor
    self.slowRotor = slowRotor
    self.reflector = reflector
  }
}
