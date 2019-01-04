import UIKit

enum Interest: String {
    case Motocycle
    case Soccer
    case Cooking
    case Climbing
    case Swimming
    case Travel
    case Running
    case Fashion
    case Programming
    case Gaming
    case Movie
    case Books
    case Photo
}

enum Characteristics {
    case age
    case gender
    case civilStatus
    case hometown
}

class MatchingAlgo {
    
    struct Person {
        let name: String
        let characteristics: [Characteristics: Any]
        let interest: [Interest]
        
    }
    
    
    var people = [Person]()
    
    init() {
        people.append(Person(name: "Michael", characteristics: [.age: 22, .gender: "M", .civilStatus: "single", .hometown: "San Francisco"], interest: [Interest.Climbing, Interest.Motocycle]  ))
        people.append(Person(name: "Laura", characteristics: [.age: 25, .gender: "F", .civilStatus: "single", .hometown: "Rome"], interest: [.Cooking, .Books, .Movie]  ))
        people.append(Person(name: "Mark", characteristics: [.age: 37, .gender: "M", .civilStatus: "married", .hometown: "Sydney"], interest: [.Photo, .Travel, .Motocycle]  ))
        people.append(Person(name: "Janice", characteristics: [.age: 18, .gender: "F", .civilStatus: "single", .hometown: "New York"], interest: [.Fashion, .Movie, .Photo, .Running, .Cooking]  ))
        people.append(Person(name: "Jessica", characteristics: [.age: 30, .gender: "F", .civilStatus: "married", .hometown: "Dublin"], interest: [.Movie, .Running, .Climbing, .Motocycle, .Travel]  ))
        people.append(Person(name: "Monique", characteristics: [.age: 28, .gender: "F", .civilStatus: "single", .hometown: "Paris"], interest: [.Fashion, .Cooking, .Movie]  ))
        people.append(Person(name: "Mila", characteristics: [.age: 33, .gender: "F", .civilStatus: "divorced", .hometown: "Prague"], interest: [.Climbing, .Movie, .Programming, .Photo, .Travel]  ))
        people.append(Person(name: "Gregory", characteristics: [.age: 41, .gender: "M", .civilStatus: "divorced", .hometown: "London"], interest: [.Programming, .Soccer, .Swimming, .Photo]  ))
        people.append(Person(name: "Jack", characteristics: [.age: 36, .gender: "M", .civilStatus: "married", .hometown: "Glasgow"], interest: [.Motocycle, .Soccer, .Books, .Cooking]  ))
        people.append(Person(name: "Joe", characteristics: [.age: 24, .gender: "M", .civilStatus: "single", .hometown: "Liverpool"], interest: [.Photo, .Programming, .Gaming] ))
        people.append(Person(name: "Denise", characteristics: [.age: 15, .gender: "F", .civilStatus: "single", .hometown: "Milan"], interest: [.Motocycle, .Travel, .Gaming]  ))
    }
    
    func introduction() {
        
        /// Removed the /n from the end of your senetence to remove unneeded spacing in your logs
        
        for i in people {
            print("Hello, my name is \(i.name), i'm \(i.characteristics[.age] ?? 0) years old, \(i.characteristics[.civilStatus] ?? 0), living in \(i.characteristics[.hometown] ?? 0).")
        }
        
    }
    
    func announceInterest() {
        let list = people.shuffled()
        for i in list {
            var string = "Hello again, my name is \(i.name) and my intrest are "
            for j in i.interest {
                if i.interest.first! == j {
                    string.append(j.rawValue)
                } else {
                    string.append(", \(j.rawValue)")
                }
            }
            string.append(".")
            print(string)
        }
        
    }
    
    func match () {
        var peopleToMatch = people
        
        while peopleToMatch.count >= 1 {
        
            for peopleIndex in 0 ..< peopleToMatch.count {
                let secondPerson = peopleToMatch[peopleIndex]
                let firstPerson = peopleToMatch[0]
                let matchedInterest = firstPerson.interest.filter(secondPerson.interest.contains)
                if (matchedInterest.count >= 3) && (firstPerson.name != secondPerson.name) {
                print("\(firstPerson.name) is matching with \(secondPerson.name) with \(matchedInterest.count) common interests.")
                }
            }
            
        peopleToMatch.removeFirst()
        
        }
        
    }
    
}

MatchingAlgo().introduction()
print("--")
MatchingAlgo().announceInterest()
print("--")
MatchingAlgo().match()


