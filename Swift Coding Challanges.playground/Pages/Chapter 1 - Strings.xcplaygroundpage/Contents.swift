//: [Previous](@previous)

import Foundation

//MARK: Challenge 1: Are the letters unique?

func hasOnlyUniqueLetters(_ string: String) -> Bool {
    return string.count == Set(string).count
}

//Test
assert(hasOnlyUniqueLetters("No duplicates") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("AaBbCc") == true, "Challenge 1 failed")
assert(hasOnlyUniqueLetters("Hello, world") == false, "Challenge 1 failed")

//MARK: Challenge 2: Is a string a palindrome?
func isPalindrome(for string: String) -> Bool {
    return String(string.lowercased().reversed()) == string.lowercased()
}

assert(isPalindrome(for: "otto") == true, "Challange 2 failed")
assert(isPalindrome(for: "rotator") == true, "Challange 2 failed")
assert(isPalindrome(for: "Rats live on no evil star") == true, "Challange 2 failed")

//MARK: Challenge 3: Do two strings contain the ame characters
func stringsContainSameChars(_ string1: String, _ string2: String) -> Bool{
    return string1.count == string2.count && Set(string1) == Set(string2)
}

//MARK: Challenge 4: Does one string contain another

extension String{
    func fuzzyContains(_ substring: String) -> Bool {
        return self.lowercased().range(of: substring.lowercased()) != nil
    }
}

assert("Hello, World!".fuzzyContains("Hello") == true, "Challange 2 failed")
assert("Hello, World!".fuzzyContains("WORLD") == true, "Challange 2 failed")

"Hello, World".fuzzyContains("GooDByE")
"Hello, World".fuzzyContains("HelLo")

//MARK: Challenge 5: Count the characters (without for-in loop)
func countCharacters(in string: String) -> [Character : Int]{
    let charArray = Array(string)
    var result = [Character : Int]()
    
    charArray.map(){ result[$0] = 0}
    charArray.map(){ result[$0]! += 1}
    
    return result
}

countCharacters(in: "Hello, World!")

//MARK: Challenge 6: Remove duplicate letters from a string

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


//MARK: Challenge 7:

//with for loop
func condenceWhitespaces(_ input: String) -> String{
    
    var firstSpace = true
    var result = ""
    
    for char in input {
        
        if char != " "{
            result.append(char)
            firstSpace = true
        }else if char == " "{
            if firstSpace == false{
                continue
            }else{
                firstSpace = false
                result.append(char)
            }
        }
    }
    return String(result)
}

condenceWhitespaces("abc")
condenceWhitespaces("     a   bb c   d  ")

//MARK: Challenge 8: String is rotated
func checkRotation(of originalString: String, for rotatedString: String) -> Bool{
    if originalString.count != rotatedString.count {return false}
    
    let temp = rotatedString + rotatedString
    return temp.contains(originalString)
}

checkRotation(of: "Hello", for: "Hello")

//MARK: Challenge 9: Find pangrams
extension String{
    
    func isPangram() -> Bool{
        
        var charSet = Set<Character>()
        for ascii in 97...122{
            charSet.insert(Character(Unicode.Scalar(ascii)!))
        }
        
        for char in self.lowercased(){
            charSet.remove(char)
            if charSet.count == 0 {return true}
        }
        return false
    }
}

"The quick brown fox jumps over the lazy dog".isPangram()
"The quick brown fox jumped over the lazy dog".isPangram()

//Easier and cleaner soution
func isPangram(_ input: String) -> Bool {
    
    let set = Set(input.lowercased())
    
    let occuringLetters = set.filter({$0 >= "a" && $0 <= "z"})
    return occuringLetters.count == 26
}

isPangram("The quick brown fox jumps over the lazy dog")
isPangram("The quick brown fox jumped over the lazy dog")

//MARK: Challenge 10: Vowels and Consonants
func countVowlesAndConsonants(in string: String) -> (vowels: Int, consonants: Int){
    
    var vowels = 0
    var consonants = 0
    
    for letter in string.lowercased(){
        
        switch letter{
        case "a", "e", "i", "o", "u":
            vowels += 1
        default:
            if letter >= "a" && letter <= "z" {
                consonants += 1
            }
        }
    }
    return (vowels: vowels, consonants: consonants)
}

countVowlesAndConsonants(in: "Mississippi")

//MARK: Challenge 11: Three different letters

func lessThanFourDifferentLetters(string1: String, string2: String) -> Bool{
    
    if string2.count != string1.count {return false}
    
    var differenceCount = 0
    
    for index in 0...string2.count - 1{
        if Array(string1)[index] != Array(string2)[index] {
            differenceCount += 1
        }
    }
    return differenceCount <= 3
}

lessThanFourDifferentLetters(string1: "Clamp", string2: "Maple")
lessThanFourDifferentLetters(string1: "Cramp", string2: "Grams")

//MARK: Challenge 12: Find longest prefix
func findLongestPrefix(input: String) -> String {
    
    let substrings = input.split(separator: " ")
    
    var tempkey = String(substrings.first!)
    var matchCount = 0
    
    while matchCount != substrings.count  {
        
        for substring in substrings{
            if substring.contains(tempkey){
                matchCount += 1
            }
        }

        if matchCount == substrings.count {break}
        matchCount = 0
        tempkey.removeLast()
    }
    
    return tempkey
}

findLongestPrefix(input: "flip flippie flippo")
findLongestPrefix(input: "swift switch swim swill")


//MARK: Challenge 13: Run-length encoding
func runLengthEncoding(for input: String) -> String {
    
    let charArray = Array(input)
    var currentPosition = 0
    var cnt = 1
    var result = ""
    
    while currentPosition < charArray.count - 1 {
        
        currentPosition += 1
        cnt += 1

        if charArray[currentPosition - 1] != charArray[currentPosition]{
            result += String(charArray[currentPosition - 1]) + "\(cnt - 1)"
            cnt = 1
        }
    }
    //Append the last element, because the was no change which appended this.
    result += String(charArray[currentPosition]) + "\(cnt)"
    
    return result
}

runLengthEncoding(for: "aabbcc")
runLengthEncoding(for: "aaabaaabaaa")
runLengthEncoding(for: "aaAAaa")
runLengthEncoding(for: "aaAAab")

//MARK: Challenge: String permutations

//Inefficient first try.
func printAllStringPermutations(for string: String){
    
    var permutations = [String]()
    
    var faculty = 1
    var tempCnt = string.count
    
    while tempCnt > 0 {
        faculty *= tempCnt
        tempCnt -= 1
    }
    
    while permutations.count != faculty{
        
        let tempSolution = string.shuffled()
        if !permutations.contains(String(tempSolution)){
            permutations.append(String(tempSolution))
        }
    }
    print(permutations)
}

//printAllStringPermutations(for: "wombat")

func challenge14(string: String, current: String = "") {
   let length = string.count
   let strArray = Array(string)
   if (length == 0) {
      // there's nothing left to re-arrange; print the result
      print(current)
      print("******")
   } else {
      print(current)
// loop through every character
      for i in 0 ..< length {
         // get the letters before me
         let left = String(strArray[0 ..< i])
         // get the letters after me
         let right = String(strArray[i+1 ..< length])
         // put those two together and carry on
         challenge14(string: left + right, current: current +
String(strArray[i]))
} }
}



//MARK: Challenge 15: Reverse the words in a string
func reverseWords(in string: String) -> String{
    
    let stringArray = string.split(separator: " ")
    
    let reversed = stringArray.map() {String($0.reversed())}
    
    return reversed.joined(separator: " ")
}

reverseWords(in: "Swift Coding Challenges")
reverseWords(in: "The quick brown fox")















//: [Next](@next)
