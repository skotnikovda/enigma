import Enigma
import Foundation

func encrypt<A: Alphabet>(
  with enigma: inout Enigma<A>,
  message: [A.LetterType]
) -> [A.LetterType] {
  var encrypted = [A.LetterType]()
  for letter in message {
    let encryptedLetter = enigma.encrypt(letter: letter)
    encrypted.append(encryptedLetter)
  }
  return encrypted
}

func main() {
  let configData = try! Data(contentsOf: URL(fileURLWithPath: "./config.json"))
  let config = try! JSONDecoder()
    .decode(EnigmaConfigurationSeeds.self, from: configData)
  let filePath = CommandLine.arguments[2]
  let dataToEncrypt = try! Data(contentsOf: URL(fileURLWithPath: filePath))
  switch CommandLine.arguments[1] {
  case "en":
    var enigmaEncryptor = EnigmaFactory.create(with: EnglishAlphabet(), from: config)
    let message = [Character](String(data: dataToEncrypt, encoding: .utf8)!)
      .filter { !" \n\t\r".contains($0) }
    let encrypted = String(encrypt(with: &enigmaEncryptor, message: message))
    try! encrypted.write(
      to: URL(fileURLWithPath: filePath),
      atomically: true, encoding: .utf8
    )
    print("Done")
  case "byte":
    var enigmaEncryptor = EnigmaFactory.create(with: ByteAlphabet(), from: config)
    let message = [UInt8](dataToEncrypt)
    let encrypted = Data(encrypt(with: &enigmaEncryptor, message: message))
    try! encrypted.write(to: URL(fileURLWithPath: filePath))
    print("Done")
  default:
    print("Invalid alphabet option")
    return
  }
}

main()
