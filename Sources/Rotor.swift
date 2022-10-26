public struct Rotor<A: Alphabet> {
  private let alphabet: A
  private let permutation: Permutation<A>
  public var position: Int
  public func forward(letter: A.LetterType) -> A.LetterType {
    var index = alphabet.letters.firstIndex(of: letter)!
    index = (index + position) % alphabet.length()
    return permutation[index]
  }
  public func backward(letter: A.LetterType) -> A.LetterType {
    var index = permutation.letters.firstIndex(of: letter)!
    index = (alphabet.length() + (index - position)) % alphabet.length()
    return alphabet[index]
  }
  public mutating func rotate() {
    self.position = (self.position + 1) % self.alphabet.length()
  }
  public init(with permutation: Permutation<A>, inPosition position: Int = 0) {
    self.alphabet = A()
    self.permutation = permutation
    self.position = position
  }
}
