public struct Reflector<A: Alphabet> {
  private let mapping: [A.LetterType: A.LetterType]
  public func reflect(letter: A.LetterType) -> A.LetterType {
    return mapping[letter]!
  }
  public init(with permutation: Permutation<A>) {
    var mapping = [A.LetterType: A.LetterType]()
    let alphabet = A()
    if alphabet.length() % 2 != 0 {
      mapping[permutation.letters.last!] = permutation.letters.last!
    }
    for i in stride(from: 1, to: permutation.letters.count, by: 2) {
      mapping[permutation.letters[i]] = permutation.letters[i - 1]
      mapping[permutation.letters[i - 1]] = permutation.letters[i]
    }
    self.mapping = mapping
  }
}
