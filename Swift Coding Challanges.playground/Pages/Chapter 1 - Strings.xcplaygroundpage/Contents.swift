//: [Previous](@previous)

import Foundation

//MARK: Challange 1: Are the letters unique?

func hasOnlyUniqueLetters(_ string: String) -> Bool {
    return string.count == Set(string).count
}

//Test
assert(hasOnlyUniqueLetters("No duplicates") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("AaBbCc") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("Hello, world") == false, "Challenge 1 failed")

//MARK: Challange 2: Is a string a palindrome?
func isPalindrome(for string: String) -> Bool {
    return String(string.lowercased().reversed()) == string.lowercased()
}

assert(isPalindrome(for: "otto") == true, "Challange 2 failed")
assert(isPalindrome(for: "rotator") == true, "Challange 2 failed")
assert(isPalindrome(for: "Rats live on no evil star") == true, "Challange 2 failed")

//MARK: Challange 3: Do two strings contain the ame characters
func stringsContainSameChars(_ string1: String, _ string2: String) -> Bool{
    return string1.count == string2.count && Set(string1) == Set(string2)
}

//MARK: Challange 4: Does one string contain another

extension String{
    func fuzzyContains(_ substring: String) -> Bool {
        return self.lowercased().range(of: substring.lowercased()) != nil
    }
}

assert("Hello, World!".fuzzyContains("Hello") == true, "Challange 2 failed")
assert("Hello, World!".fuzzyContains("WORLD") == true, "Challange 2 failed")

"Hello, World".fuzzyContains("GooDByE")
"Hello, World".fuzzyContains("HelLo")

//MARK: Challange 5: Count the characters (without for-in loop)
func countCharacters(in string: String) -> [Character : Int]{
    let charArray = Array(string)
    var result = [Character : Int]()
    
    charArray.map(){ result[$0] = 0}
    charArray.map(){ result[$0]! += 1}
    
    return result
}

countCharacters(in: "Hello, World!")

//MARK: Challange 6: Remove duplicate letters from a string

func removeDuplicateLetters(in string: String) -> String {
   var charArr = [Character]()
    
    for letter in string{
        if !charArr.contains(letter){
            charArr.append(letter)
        }
    }
    return String(charArr)
}

removeDuplicateLetters(in: "XXzzZZAAAdD")









//: [Next](@next)
