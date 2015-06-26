# ContinuousRange

`ContinuousRange` allows you to quickly scale numbers in Swift.

## Interface

```swift
struct ContinuousRange: Equatable {

    public let min: Double
    public let max: Double

    public init?(min: Double, max: Double)
    
    public func scaleValue(value: Double, toRange: ContinuousRange) -> Double
    public func scaleValue(value: Double, fromRange: ContinuousRange) -> Double
}

public func ==(continuousRange: ContinuousRange, otherContinuousRange: ContinuousRange) -> Bool
```

## Tests

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
