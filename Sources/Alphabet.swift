public protocol Alphabet {
  associatedtype LetterType: Hashable
  var letters: [LetterType] { get }
  init()
}

public class EnglishAlphabet: Alphabet {
  public let letters: [Character] = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
  ]
  public required init() {}
}

public class ByteAlphabet: Alphabet {
  public let letters: [UInt8]
  public required init() {
    self.letters = [UInt8](0...255)
  }
}

extension Alphabet {
  subscript(index: Int) -> Self.LetterType {
    get {
      return letters[index]
    }
  }
  func length() -> Int {
    return letters.count
  }
}

public struct Permutation<A: Alphabet> {
  let letters: [A.LetterType]
  subscript(index: Int) -> A.LetterType {
    get {
      return letters[index]
    }
  }
  init(of alphabet: A, with seed: UInt64) {
    var generator = SeededGenerator(seed: seed)
    self.letters = alphabet.letters.shuffled(using: &generator)
  }
}
