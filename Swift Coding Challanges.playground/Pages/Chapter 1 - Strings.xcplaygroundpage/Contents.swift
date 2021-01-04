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

//: [Next](@next)
