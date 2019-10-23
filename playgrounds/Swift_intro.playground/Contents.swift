///променлива
var str = "Hello, playground"
let x = 123

let y = 123.1

///константа
let z = Double(x) + y

let b = !true
let x32:Int = 123

if b {
    print("B = \(!b)")
    print("another line")
} else if x > 24 {
    
} else {
    print("X is less than 24")
}

let alwaysInt:Int //= b ? 6 : 3

if b {
    alwaysInt = 6
} else {
    alwaysInt = 3
}

print(alwaysInt)


//Int, Double, Bool, String
//nil
//Int?, Double?, Bool?, String?

var x2:Int? = nil
//var x2:Int? = nil

let 🇧🇬 = 0
var 🇬🇧 = 0

//the game
if 🇬🇧 == 0 {
  🇬🇧 += 6
}

//print("Full time result: 🇧🇬 - 🇬🇧 \(🇧🇬) : \(🇬🇧)")

if let x = x2,x < 30 && x > 5 {
    print(x)
} else {
//    print("what? \(променлива)")
}


///switch оператор
let someNumber = 10
   switch someNumber {
   case 1:
    ///старото поведение, което имаме в C, C++
    fallthrough
case 3:
       print("Едно или три")
   case 4..<10:
        print("Между 3 и 10")
   default:
       print("Някакво друго число")
   }

///интересно записване на цяло число
let count = 34_000_000
let things = "ябълки"
var expression: String
switch count {
case 0:
    expression = "николко"
case 1..<10:
    expression = "няколко"
case 10..<100:
    expression = "десетки"
case 100..<1000:
    expression = "стотици"
default:
    expression = "много"
}
print("\(count) са \(expression) \(things)")

/// n-торка или tuple - "пакет" от няколко променливи от различни (може и еднакви) типове
let point = (0,1)

   switch point {
   case (let x, 0):
       print("точка (\(x), 0) се намира на абсциса х")
   case (0, let y):
       print("точка (0, \(y)) се намира на ордината у")
   case let (x, y):
       print("точка (\(x), \(y)) е някъде другаде")
   }

var i = 5
i += 1
/// нямаме оператор ++
//i+++++i
print(i)
let ss = 1...5

for (index, v) in ss.enumerated() {
    print("\(index) по 5 е \(index * 5)")
    print("\(index) - \(v)")
}
///списък от символни низове
let names = [ "Драго", "Емил", "Петко", "Спас"]
for name in names {
    print("Здравей, \(name)!")
}

/// речник - Dictionary - ключ -> стойност - двойка. Има бързо търсене.
let numberOfLegs:[String: Int?] = ["паяци": 8, "мравки": nil, "котки": 4]
let keys:[String] = Array<String>(numberOfLegs.keys).sorted(by: >)
/// for цикъл
for animalName in keys {
    let legCount = numberOfLegs[animalName]
    print("\(animalName)те имат \(legCount) крака")
}

///изброим тип
enum Color {
    case pink
    case green
    case black
    case blue
    case white
    case noColor
}

let cc = Color.pink
///протокол
protocol Sellable {
    var pricePerUnitNew: Double { get }
    var isAvailable: Bool { set get }
}
///функция, без имена на променливите
func sum(_ a:Int, _ b:Int) -> Int {
    //a += 5
    return a + b
}
///функция с имена на променливите. Извиква се sum2(a1:5, b1:7)
func sum2(a1 a:Int, b1 b:Int) -> Int {
    //a += 5
    return a + b
}

print(sum(1, 3))
/// структура и клас
/// При структурите няма наследяване!
/// Структурите (инстанции от тип структура) се предават по стойност
/// При класовете __има__ наследяване!
class/*struct*/ Merchandise {
    private var _realName:String
    var name: String {
        get {
            return _realName
        }
        set {
            //check
            _realName = newValue
        }
    }
       var pricePerUnit: Double
    var isAvailable: Bool
   
   //конструктор
   init(name: String, pricePerUnit: Double, isAvailable:Bool) {
        self._realName = name
              self.pricePerUnit = pricePerUnit
           self.isAvailable = isAvailable
    }
    
    convenience init(name: String) {
        self.init(name: name, pricePerUnit: 100, isAvailable: false)
    }
    
    func pr() {
      print("\(name)")
    }
    
    
    /// пример с hashable
    var hashValue: Int {
        get {
            name.hashValue
        }
    }
    
    func hash(into hasher: inout Hasher) {
        //nothing
    }
    
    ///примерна имплемнтация
    static func == (lhs: Merchandise, rhs: Merchandise) -> Bool {
        return lhs.name == rhs.name && lhs.pricePerUnit == rhs.pricePerUnit
    }
}

var t = Merchandise(name: "X", pricePerUnit: 100, isAvailable: false)
print(t.isAvailable)

t.pr()

/// разширение на клас/ структура
extension Merchandise {
    var name2: String {
        get {
            return "My Extrention!"
        }
    }
      
}
/// разширение с имплементация на протокол. Само необходимите методи трябва да добавят.
extension Merchandise: Sellable {
    
    var pricePerUnitNew: Double {
        get {
            return pricePerUnit * 1.2
        }
    }
}

/// възможно е да дефинираме, че даден клас имплементира даден протокол
/// без да имплементираме нищо.
extension Merchandise: Hashable {
    
}
/// разширяваме базов тип
extension String {
    var toDollars:String {
        get {
            let levs = Double.init(self)
            return "$\((levs ?? 0) / 1.77)"
        }
    }
}


print(t.name2)
print(t.pricePerUnitNew)

let levs = "177"

print(levs.toDollars)

var intX = 5
var intY = intX
intX = 7

print("IntY = \(intY)")

//reference type
var m:Merchandise = Merchandise(name: "M", pricePerUnit: 100, isAvailable: false)
var copyM:Merchandise = m

m.name = "M new"

print("copyM.name = \(copyM.name)")

///функция (кложър с име)
func compare1 (a: String, b: String) -> Bool {
    return a > b
}
/// променлива от тип функция, инициализирана с кложър (анонимна функция)
var compare: (String, String) -> Bool = { a, b in
    a > b
}
/// кложър, който не връща нищо () или Void
var compare4: (String, String) -> () = { a, b in
     a > b
}

///сортиране
print(names.sorted(by: compare1))
print(names.sorted(by: compare))
print(names.sorted(by: { $0 > $1 }))
print(names.sorted() { $0 > $1 })

/// това е еквивалентно на записа, който следва
names.sorted(by: { $0 > $1 })
/// можем да изпуснем __последния аргумент, ако той е кложър__
/// и да добавим кложъра непосредствена след извикването на функцията
names.sorted() { $0 > $1 }


///сортираме, като подаваме функция от тип (String, String) -> Bool ( т.е. оператор за сравнение)
print(names.sorted(by: >))



///Клоужъри
var handlers:[()->Void] = []
///трябва да добавим атрибута @escaping иначе няма да се компилира,
///понеже фукцията, която е параметър, "надживява" фукцията "баща"

///функция, която изиксва параметър от тип клоужър
func escapingClosure(f: @escaping ()->Void) {
    handlers.append(f)
}

handlers.append {
    print("test")
}

escapingClosure {
    print("test 2")
}

//активираме всички функции
for f in handlers {
    f()
}

