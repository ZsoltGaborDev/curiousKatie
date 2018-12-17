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
        let interest: [Interest: Any]
    }
    
    
    var people = [Person]()
    
    init() {
        people.append(Person(name: "Michael", characteristics: [.age: 22, .gender: "M", .civilStatus: "single", .hometown: "San Francisco"], interest: [Interest.Climbing: "only on summer time", Interest.Motocycle: "if weather permit it " ]  ))
        people.append(Person(name: "Laura", characteristics: [.age: 25, .gender: "F", .civilStatus: "single", .hometown: "Rome"], interest: [.Cooking: "specially italian food", .Books: "of any kind, but SF prefered.", .Movie: "action, documnetary and comedy prefered"]  ))
        people.append(Person(name: "Mark", characteristics: [.age: 37, .gender: "M", .civilStatus: "married", .hometown: "Sydney"], interest: [.Photo: "artistical photos during traveling ", .Travel: "doing photography courses to the participants ", .Motocycle: "only in free time "]  ))
        people.append(Person(name: "Janice", characteristics: [.age: 18, .gender: "F", .civilStatus: "single", .hometown: "New York"], interest: [.Fashion: "doing for hobby and it's my job too.", .Movie: "is the perfect method for relax", .Photo: "only in free time", .Running: "every early morning.", .Cooking: "interested for exotic food."]  ))
        people.append(Person(name: "Jessica", characteristics: [.age: 30, .gender: "F", .civilStatus: "married", .hometown: "Dublin"], interest: [.Movie: " loving films registered by James Cameron.", .Running: "only in good company", .Climbing: "as weekend - relax with firends", .Motocycle: "part of a healty life.", .Travel: "becuase it makes people growing"]  ))
        people.append(Person(name: "Monique", characteristics: [.age: 28, .gender: "F", .civilStatus: "single", .hometown: "Paris"], interest: [.Fashion: "loving to be cool", .Cooking: "becuase we are what we eat", .Movie: "when it's possible"]  ))
        people.append(Person(name: "Mila", characteristics: [.age: 33, .gender: "F", .civilStatus: "divorced", .hometown: "Prague"], interest: [.Climbing: "to clear the mind after a stressful week", .Movie: "only in good company", .Programming: "it's for work and pleasure", .Photo: "makes part of work", .Travel: "doing group leader for teenagers"]  ))
        people.append(Person(name: "Gregory", characteristics: [.age: 41, .gender: "M", .civilStatus: "divorced", .hometown: "London"], interest: [.Programming: " as a freelancer", .Soccer: "on weekend with friends", .Swimming: "like lifeguard in the summer season", .Photo: "as hobby"]  ))
        people.append(Person(name: "Jack", characteristics: [.age: 36, .gender: "M", .civilStatus: "married", .hometown: "Glasgow"], interest: [.Motocycle: "loving the speed and adrenaline.", .Soccer: "when weather permit it.", .Books: "as a big passion.", .Cooking: "indian, mexican and japoneese food."]  ))
        people.append(Person(name: "Joe", characteristics: [.age: 24, .gender: "M", .civilStatus: "single", .hometown: "Liverpool"], interest: [.Photo: "because art is food for soul.", .Programming: "in some startup projects.", .Gaming: "day and night."] ))
        people.append(Person(name: "Denise", characteristics: [.age: 15, .gender: "F", .civilStatus: "single", .hometown: "Milan"], interest: [.Motocycle: "only in summer time.", .Travel: "everywhere, anytime when possible. ", .Gaming: "only strategical games."]  ))
    
    }
    
    func introduction() {
        
        for i in people {
            print("Hello, my name is \(i.name), i'm \(i.characteristics[.age] ?? 0) years old, \(i.characteristics[.civilStatus] ?? 0), living in \(i.characteristics[.hometown] ?? 0).\n ")
        }
        
    }
    
    func announceInterest() {
        let list = people.shuffled()
        
        for i in list {
            print("Katie: \(i.name), could you please share us your interests?")
                
            for j in i.interest {
                print("\(i.name): I'm interested for \(j.key).")
                
            }
            print("")
        }
    
    }
    
    func match (interest: Interest) {
        let interestToCheck = interest.rawValue
        print("The persons interested for \(interestToCheck) are: ")
        
        for i in people {
            for j in i.interest {
                if j.key.rawValue == interestToCheck {
                    print("\(i.name), \(j.value )")
                }

            }
        }
        
    }
    
}

MatchingAlgo().introduction()
MatchingAlgo().announceInterest()
MatchingAlgo().match(interest: .Cooking)

