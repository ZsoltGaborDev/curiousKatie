import UIKit

//list of interest
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

// list of characteristics
enum Characteristics {
    case age
    case gender
    case civilStatus
    case hometown
}

class MatchingAlgo {
    
    struct Person: Equatable {
        static func == (lhs: MatchingAlgo.Person, rhs:MatchingAlgo.Person) -> Bool {
            return lhs.name == rhs.name
        }
        // properties
        let name: String
        let characteristics: [Characteristics: Any]
        var interest: [Interest]
    }
    var people = [Person]()
    
    //initialization
    init() {
        people.append(Person(name: "Michael", characteristics: [.age: 22, .gender: "M", .civilStatus: "single", .hometown: "San Francisco"], interest: [.Climbing, .Travel, .Motocycle, .Movie]  ))
        people.append(Person(name: "Laura", characteristics: [.age: 25, .gender: "F", .civilStatus: "single", .hometown: "Rome"], interest: [.Cooking, .Travel, .Books, .Movie]  ))
        people.append(Person(name: "Mark", characteristics: [.age: 37, .gender: "M", .civilStatus: "married", .hometown: "Sydney"], interest: [.Photo, .Travel, .Motocycle, .Movie]  ))
        people.append(Person(name: "Janice", characteristics: [.age: 18, .gender: "F", .civilStatus: "single", .hometown: "New York"], interest: [.Fashion, .Movie, .Photo, .Running, .Travel,.Cooking]  ))
        people.append(Person(name: "Jessica", characteristics: [.age: 30, .gender: "F", .civilStatus: "married", .hometown: "Dublin"], interest: [.Movie, .Running, .Climbing, .Motocycle, .Travel]  ))
        people.append(Person(name: "Monique", characteristics: [.age: 28, .gender: "F", .civilStatus: "single", .hometown: "Paris"], interest: [.Fashion, .Cooking, .Travel, .Movie]  ))
        people.append(Person(name: "Mila", characteristics: [.age: 33, .gender: "F", .civilStatus: "divorced", .hometown: "Prague"], interest: [.Climbing, .Movie, .Programming, .Photo, .Travel]  ))
        people.append(Person(name: "Gregory", characteristics: [.age: 41, .gender: "M", .civilStatus: "divorced", .hometown: "London"], interest: [.Programming, .Soccer, .Swimming, .Photo, .Movie, .Travel]  ))
        people.append(Person(name: "Jack", characteristics: [.age: 36, .gender: "M", .civilStatus: "married", .hometown: "Glasgow"], interest: [.Motocycle, .Movie, .Soccer, .Books, .Cooking, .Travel]  ))
        people.append(Person(name: "Joe", characteristics: [.age: 24, .gender: "M", .civilStatus: "single", .hometown: "Liverpool"], interest: [.Photo, .Programming, .Movie, .Gaming, .Travel] ))
    }
    
    //Participants will introduce themselves one by one.
    func introduction() {
        
        for i in people {
            print("Hello, my name is \(i.name), i'm \(i.characteristics[.age] ?? 0) years old, \(i.characteristics[.civilStatus] ?? 0), living in \(i.characteristics[.hometown] ?? 0).")
        }
    }
    
    //randomly nominate a participant to share their interests.
    func announceInterest() {
        let list = people.shuffled()
        for i in list {
            var string = "Hello again, my name is \(i.name) and my interest are "
            for j in i.interest {
                if i.interest.first!.rawValue == j.rawValue {
                    string.append(j.rawValue)
                } else {
                    string.append(", \(j.rawValue)")
                }
            }
            string.append(".")
            print(string)
        }
    }
  
    // pairing and logging the pairing results ( paired everybody with everybody crossing all their interests one by one)
    func match() {
        var peopleToMatch = people
        
        while peopleToMatch.count >= 1 {
            for peopleIndex in 0 ..< peopleToMatch.count {
                let secondPerson = peopleToMatch[peopleIndex]
                let firstPerson = peopleToMatch[0]
                let matchedInterest = firstPerson.interest.filter(secondPerson.interest.contains)
                
                if (matchedInterest.count >= 2) && (firstPerson.name != secondPerson.name) {
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



