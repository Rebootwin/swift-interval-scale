# Description

`ContinuousRange` allows you to quickly scale numbers in Swift.

# Interface

```swift
struct ContinuousRange: Equatable {

    let min: Double
    let max: Double

    init?(min: Double, max: Double)
    
    func scaleValue(value: Double, toRange: ContinuousRange) -> Double
    func scaleValue(value: Double, fromRange: ContinuousRange) -> Double
    
}

func ==(continuousRange: ContinuousRange, otherContinuousRange: ContinuousRange) -> Bool
```

# Tests

```swift
class ContinuousRangeTests: XCTestCase {

    func testInit()
    func testInitNil()
    
    func testEquatableTrue()
    func testEquatableFalse()
    
    func testScaleToRange()
    func testScaleFromRange()
    
}
```
