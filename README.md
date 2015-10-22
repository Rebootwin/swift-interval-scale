# Description

`Scale` allows you to quickly scale numbers in Swift.

# Interface

```
struct Scale: Equatable {

    let min: Double
    let max: Double
    
    func convert(value: Double, toScale: Scale) -> Double
    func convert(value: Double, fromScale: Scale) -> Double
    
}
```

# Tests

```
class ScaleTests: XCTestCase {

    func testInit()

    func testEquatableTrue()
    func testEquatableFalse()

    func testConvertToScale()
    func testConvertFromScale()
    
}
```
