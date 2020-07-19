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
print("\n")

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
print("\n")

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
print("\n")

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
print("\n")

//DAY 5
//Writing functions

func printHelp(){
    let msg = """
Welcome to my App!
This is Madhukesh.
"""
    print(msg)
}
printHelp()

//Accepting parameters
func square(number:Int){
    print(number * number)
}
square(number: 4)

//Returning values
func squared(number:Int)->Int{
    return (number * number)
}
let ans = squared(number: 8)
print(ans)

//Parameters names
func sayHello(to name:String){
    print("Hello \(name)")
}
sayHello(to: "Madhu")

//Omitting parameter names
func greet(_ person:String){
    print("Hello \(person)!")
}
greet("Madhukesh D")

//Default parameters
func greetings(_ person:String , nicely:Bool = true){
    if(nicely == true){
        print("Hello, \(person)")
    }else{
        print("oh no! \(person) again..")
    }
}
greetings("Sachin")
greetings("Dhoni",nicely: false)

//Variadic functions
func sq(numbers:Int...){
    for number in numbers{
        print("\(number) squared is \(number * number)")
    }
}
sq(numbers: 1,2,3)

//Writing throwing functions
enum PasswordError:Error{
    case obvious
}

func checkPassword(_ password:String)throws -> Bool{
    if password == "Password"{
        throw PasswordError.obvious
    }
    return true
}

//Running throwing fucntions
do{
    try checkPassword("Password")
    print("This password is good")
} catch{
       print("U cant use this password")
   }

//Inout parameters
func doubleInPlace(number: inout Int){
    number *= 2
    print(number)
}

var myNum = 2
doubleInPlace(number: &myNum)
print("\n")


//DAY 6
//Creating simple closures
 
let driving = {
    print("Hello this is closure!")
}

driving()

//Accepting parameters in closures
let walking = {(place:String)in
    print("Im walking \(place)")
}

walking("upstairs")

//Returning values in closures
let riding = {(place:String)-> String in
    return "Im riding on \(place)"
}

let ride = riding("mountain")
print(ride)

//Closures as parameters
func travel(action:()->Void){
    print("Im getting ready")
    action()
    print("I arrived")
}

travel(action: driving)

//Trailing closure syntax
func travel1(action:()->Void){
    print("Im getting")
    action()
    print("Done")
}
travel1 {
    print("helo")
}
print("\n")

//DAY 7
//Using closures as parameters when they accept parameters
func travel2(action:(String)->Void){
    print("Im getting")
    action("London")
    print("Done")
}
travel2 {(place:String)in
    print("helo \(place)")
}

//Using closures as parameters when they return parameters
func go(action:(String)->String){
    print("Im travelling to")
    let desc = action("London")
    print(desc)
    print("I arrived")
}

go{(place:String)->String in
    return "Im going to \(place) in my car"
}

//Shorthand parameter names
go{
    "Im goin to \($0)"
}

//Closures with multiple parameters
func travelto(action:(String,Int)->String){
    print("Im getting ready to go.")
    let description = action("London",60)
    print(description)
    print("I Arrived")
}

travelto{
    "Im going to \($0) at \($1) rate per hour"
}

//Returning closures from functions
func trav()->(String)->Void{
    return{
        print("Im going to \($0) ")
    }
}
let res = trav()
res("Bangalore")

let res1 = trav()("Mumbai")

//Capturing values

let r = t()
r("London")

func t()-> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). Im going to \($0)")
        counter += 1
    }
}
r("London")
print("\n")

//DAY 8
//Creating structs

struct Sports{
    var name:String
}

var tennis = Sports(name:"Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)

//Computed properties
struct Sport{
    var name : String
    var isOlympicSport : Bool
    
    var OlympicStatus:String{
        if isOlympicSport{
            return "\(name) is Olympic Sport"
        }else{
            return "\(name) is not Olympic Sport"
        }
    }
}

let chessBoxing = Sport(name: "Chess Boxing", isOlympicSport: false)
print(chessBoxing.OlympicStatus)

//Property Observers

struct Progress{
    var task: String
    var amount: Int{
        didSet{
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task:"Loading data", amount:0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//Methods
struct City{
    var population:Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
 let london = City(population: 9_000_000)
print(london.collectTaxes())

//Mutating methods
struct Person{
    var name: String
    
    mutating func makeAnonymous(){
        name = "Anonymous"
    }
}
var person = Person(name:"Madhu")
person.makeAnonymous()

//Properties and methods of Strings
let string = "Hello Swift"

print(string.count)
print(string.hasPrefix("Hello"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of Arrays
var toys = ["Woodys"]

print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 1)
print("\n")

//DAY 9
//Intializers

struct User{
    var userName:String
    
    init(){
        userName = "Anonymous"
        print("Creating new user")
    }
}

var user = User()
user.userName = ("Madhukesh")

//Referring to the current instance

struct PersonName{
    var name:String
    
    init(name:String){
        print("\(name) was born")
        self.name = name
    }
}

//Family tree
struct FamilyTree{
    init(){
        print("Creating family tree")
    }
}

struct Person1{
    var name:String
    lazy var familyTree = FamilyTree()
    
    init(name:String){
        self.name = name
    }
}

var ed = Person1(name:"ed")
ed.familyTree

//Static properties and methods
struct Student{
    static var classSize = 0
    var name: String
    
    init(name:String){
        self.name = name
        Student.classSize += 1
    }
}

let madhu = Student(name:"Madhu")
let naveen = Student(name:"Naveen")
print(Student.classSize)

//Access control
struct Person2{
    private var id:String
    
    init(id:String){
        self.id = id
    }
    
    func identify()->String{
        return "My social security number is \(id)"
    }
}

var rahul = Person2(id: "1223")
print("\n")

//DAY 10
//Creating own class

class Dog{
    var name : String
    var breed: String
    
    init(name:String, breed:String){
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Doggy", breed: "Poodle")
print(poppy.name)

//Class interitence
class Poodle: Dog{
    init(name:String){
        super.init(name: name, breed: "Poodle")
    }
    
}

//Overiding methods
class Doggie{
    func makeNoise(){
        print("Woof!")
    }
}

class Doodle:Doggie{
    override func makeNoise() {
        print("Yip")
    }
}
let puppy = Doodle()
puppy.makeNoise()

//Final classes
final class Jog{
    var place:String
    var time:String
    
    init(place:String,time:String){
        self.place = place
        self.time = time
    }
}

//Copying Objects
class Singer{
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Beiber"
print(singer.name)

//Deinitializers
class P1{
    var name = "Madhukesh"
    
    init(){
        print("\(name) is alive")
    }
    
    func greetings(){
        print("Hello I'm \(name)")
    }
    deinit {
        print("He is no more")
    }
}

for _ in 1...3{
    let person = P1()
    person.greetings()
}

//Mutatibility
class Dancer{
    var name = "MJ"
}

let mj = Dancer()
mj.name = "Prabhudeva"
print(mj.name)
print("\n")

//DAY 11
//Protocols
protocol Identifiable{
    var id : String{get set}
}

struct Users: Identifiable {
    var id: String
}

func displayID(thing:Identifiable){
    print("My ID is \(thing.id)")
}

//Protocols inheritance
protocol Payable{
    func calculateWages()
}

protocol NeedsTraining{
    func study()
}

protocol HasVacation{
    func takeVacation(days:Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation{}

//Extensions
extension Int{
    func squared() -> Int{
        return self * self
    }
}
let number = 8
number.squared()

extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
}

//Protocols extension
let pythons = ["Ram", "Shayam", "Bham", "Tom"]
let beatle = Set(["John","Paul","George","Ringo"])

extension Collection{
    func summarize(){
        print("There are \(count) of us:")
        
        for name in self{
            print(name)
        }
    }
}
pythons.summarize()
beatle.summarize()

//Protocol oriented programming
protocol identifiable {
    var id: String { get set }
    func identify()
}

extension identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct Userss: identifiable {
    var id: String
}

let Madhu = Userss(id: "madhu")
Madhu.identify()
print("\n")

//DAY 12
//Handling missing data
var newAge : Int? = nil
print(newAge)
newAge = 22

//Unwrapping optionals
var aName: String? = nil

if let unwrapped = aName{
    print("\(unwrapped.count) letters")
}
else{
    print("Missing name")
}

//Unwrapping using guard
func myGreet(_ name:String?){
    guard let unwrapped = name else {
        print("You dint provide name")
        return
    }
    print("hello,\(unwrapped)")
}

//Force unwrapping
let strn = "5"
let num = Int(strn)!

//Implicitly unwrapped optionals

let petAge: Int! = nil

//Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user5 = username(for: 15) ?? "Anonymous"

//Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatless = names.first?.uppercased()

//Optional try
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

//Failable initializers
struct Person3 {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//Typecasting
class Animal { }
class Fish: Animal { }

class Doggy: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Doggy(), Fish(), Doggy()]

for pet in pets {
    if let dog = pet as? Doggy {
        dog.makeNoise()
    }
}
print("\n")

//DAY 13
//Consolidation 1
//Swift Review 1
var variableName = "Swift"
variableName = "SwiftUI"

let constName = "Swift"

var name265:String
name265 = "Madhu"
// var name265 = "Madhu"

var marks:Int
marks = 122
// var marks = 122

var isSingle:Bool
isSingle = true
// var isSingle = true

var longitude: Double
longitude = 1223.334
// var longitude = 1223.334

var latitude: Float
latitude = -1872.33
// var latitude = -1872.33


var x = 10
x = x+1
x = x-1
x = x*x

var y = 10
y += 1
y -= 1

var z = x+y

x > 3
x < 3
x == 3
x >= 3
 
name265 == "MAdhu"
name265 != "MAdhu"
isSingle
!isSingle

"My name is \(name265)"
 
var evenNumbers = [2,4,6,8]
var nam:[String] = ["ram","sita"]
var subjects:[Any] = ["maths","science","social",3]
subjects[0]
type(of: subjects)

var songs: [String] = []
var both = nam + subjects

var personSwift = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

personSwift["middle"]
personSwift["month"]

var action: String
var perSon = "hater"

if perSon == "hater" {
    action = "hate"
}

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}
print("\n")

//DAY 14
//Consolidation 1
//Swift Review 2
func favAlbum(){
    print("My fav ablum is GBSM")
}
favAlbum()

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLetters(in: "Hello")

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}
//? optional

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus(weather: WeatherType.cloud)

struct Person6 {
    var clothes: String
    var shoes: String
}

let taylor1 = Person6(clothes: "T-shirts", shoes: "sneakers")
let other = Person6(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor1
taylorCopy.shoes = "flip flops"

print(taylor1)
print(taylorCopy)

class Person7 {
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}
print("\n")

//DAY 15
//Consolidation 1
//Swift Review 3
struct Person8 {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor3 = Person8(clothes: "T-shirts")
taylor3.clothes = "short skirts"

struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

let vw = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
