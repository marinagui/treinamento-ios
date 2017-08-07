//: Playground - noun: a place where people can play

import UIKit

struct Point {
    var x: Double
    var y: Double
}

func square (radix: Double) -> Double {
    return Double(pow(radix, 2))
}

func calculateDistance (x: Double, y:Double) -> Double {
    return sqrt(square(radix: x) + square(radix: y))
}

func randomBetweenNumbers(firstNum: Double, secondNum: Double) -> Double{
    return Double(arc4random()) / Double(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}

func generatePoint() -> Point {
    let x = randomBetweenNumbers(firstNum: 0.0, secondNum: 1.0)
    let y = randomBetweenNumbers(firstNum: 0.0, secondNum: 1.0)
    return Point(x: x, y: y)
}

func isInside(point:Point) -> Bool {
    if (calculateDistance(x: point.x, y: point.y) <= 1.0) {
        return true
    }
    return false
}

func calculatePi() -> Double {
    var total:Double = 0.0
    let n = 10000
    for _ in 0..<n {
        let rock = generatePoint()
        if (isInside(point: rock)) {
            total = total + 1.0
        }
    }
    
    return total * 4 / Double(n);
}

func main() {
    print("O valor de pi é \(calculatePi())")
}







