import UIKit

var str = "Hello, playground"
str = "GoodBye"


var age = 38
var population = 1_000_000

//Multiple line strings
var str1 = """
This goes
over multiple
lines
"""
var str2 = """
This goes \
over multiple \
lines
"""

//Double and Boolean
var pi = 3.141
var awesome = true

//String Interpolation
var score = 85
var str3 = "Score is \(score)"
var results = "The test results are \(str3)"

//Constants
let taylor = "swift"

//TypeAnnotations
let myName: String = "Madhukesh"
let myAge: Int = 22
let myHeight: Double = 5.8
let iAmAwesome: Bool = true

//DAY 2
//Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john,paul,george,ringo]
beatles[2]

//Sets
let colors = Set(["red","blue","green"])
let colors2 = Set(["red","blue","green","red","green"])

//Tuples
var name = (first:"Madhu",last:"D")
name.0
name.first

//Arrays vs Sets vs Tuples
let address = (house:"48",street:"Jayadeva hostel road")
let set = Set(["apple","astronaut","azalea"])
let week = ["mon","tue","wed"]

//Dictionaries
let heights = [
"Madhukesh":5.8,
"Dawan":5.9
]
heights["Madhukesh"]

//Dictionaries default values
let favouriteIcccream = [
    "Madhu":"Vanilla",
    "Perk":"Mango"
]
favouriteIcccream["Madhu"]
favouriteIcccream["Ananya",default:"Chocolate"]

//Creating empty collections
var teams = [String: String]()
teams["Paul"] = "Red"
var result = [Int]()
var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>()
var results1 = Array<Int>()

//Enums
enum Result {
    case success
    case failure
}
let results2 = Result.failure

//Enum associated values
enum Activity{
    case talking(topic:String)
    case running(destination:String)
    case singing(vol:Int)
}
let talking = Activity.talking(topic: "Football")

//Enum raw values
enum Planet: Int{
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 3)

//DAY3
//Arthmetic operators
let firstScore = 12
let secondScore = 4

let sum = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

//Operators overloading
let a = 2
let b = 3 + 2

let firstName = "Madhukesh "
let lastName = firstName + "D"

let friends = ["madhu","naveen"]
let friends2 = ["dawan","bhuvan"]
let gang = friends + friends2

//Compound operators
var value = 50
value -= 5

var myfirstName = "My Name is "
myfirstName += "Madhukesh"

//Comparision operators
var scoreA = 10
var scoreB = 12

scoreA == scoreB
scoreA != scoreB

scoreA < scoreB
scoreA >= scoreB

"hello" <= "gswif"

//Conditions
let firstCard = 6
let secondCard = 12

if(firstCard + secondCard == 2){
    print("Hi")
} else if(firstCard + secondCard == 21){
    print("Hello")
} else{
    print("Bye")
}

//Combining conditions
let age1 = 24
let age2 = 17

if(age1 > 18 && age2 > 18){
    print("Both are above 18yrs")
}else{
    if(age1 > 18 || age2 > 18){
        print("One is above 18")
    }
}

//Ternary operator

let myFriendAge = 12
let myFriend1Age = 13
print( myFriendAge==myFriend1Age ? "Same Age" : "Different Age" )

//Switch statements
let weather = "sunny"

switch weather{
case "rainy":
    print("Carry Umbrella")
case "cold":
    print("Wear sweater")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Have a nice day")
}

//Range operator

let myScore = 90

switch myScore {
case 0..<50:
    print("Failed Badly")
case 50..<70:
    print("You did Ok")
default:
    print("You did Great!")
}

//DAY 4
//For loops
let count = 1...10

for number in count{
    print("Number is \(number)")
}

let labels = ["red","blue","pink"]

for label in labels {
    print("Labels are \(label)")
}

print("Players gonna")

for _ in 1..<5{
    print("play")
}

//While loops

var n = 1

while n<10{
    print("Number is \(n)")
    n += 1
}
print("Here Im")

//Repeat loops

var m = 1

repeat{
    print("Number is \(m)")
    m += 1
} while m <= 4

print("Ready")

while false {
    print("This is false")
}

repeat{
    print("this is false")
} while false

//Exiting loops
var countDown = 10

while countDown >= 0{
    print(countDown)
    
    if(countDown == 4){
        print("Im bored lets Blast off!")
        break
    }
    countDown -= 1
}
print("Blast Off!")

//Exiting multiple loops
outerLoop: for i in 1...5{
    for j in 1...5{
        let product = i * j
        print("\(i)*\(j) is \(product)")
        if(product == 15){
            print("Its a Bull's eye")
            break outerLoop
        }
    }
}

//Skipping items
for i in 1...10{
    if i % 2 == 1{
        continue
    }
    print(i)
}

//Infinite loops
var counter = 0

while true{
    print(" ")
    counter += 1
    
    if(counter == 273){
        break
    }
}
