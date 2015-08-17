//
// The MIT License (MIT)
//
// Copyright (c) 2015 Rudolf Adamkovič
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest

class ContinuousRangeTests: XCTestCase {
    
    func testInit() {
        
        // Arrange
        
        guard let continuousRange = ContinuousRange(min: 0, max: 1) else {
            preconditionFailure()
        }
        
        // Assert
        
        XCTAssertEqual(0, continuousRange.min)
        XCTAssertEqual(1, continuousRange.max)
        
    }
    
    func testInitNil() {
        
        // Arrange
        
        let continuousRange = ContinuousRange(min: 100, max: 100)
        
        // Assert
        
        XCTAssert(continuousRange == nil)
        
    }
    
    func testEquatableTrue() {
        
        // Arrange
        
        guard
            let continuousRange1 = ContinuousRange(min: 0, max: 1),
            let continuousRange2 = ContinuousRange(min: 0, max: 1) else {
                preconditionFailure()
        }
        
        // Assert
        
        XCTAssert(continuousRange1 == continuousRange2)
        
    }
    
    func testEquatableFalse() {
        
        // Arrange
        
        guard
            let continuousRange1 = ContinuousRange(min: 1, max: 0),
            let continuousRange2 = ContinuousRange(min: 0, max: 1) else {
                preconditionFailure()
        }
        
        // Assert
        
        XCTAssert(continuousRange1 != continuousRange2)
        
    }
    
    func testScaleToRange() {
        
        // Arrange
        
        guard
            let fromRange = ContinuousRange(min: -1, max: +1),
            let toRange = ContinuousRange(min: -100, max: +100) else {
                preconditionFailure()
        }
        
        // Act
        
        let scaledMin = fromRange.scaleValue(-1, toRange: toRange)
        let scaledMax = fromRange.scaleValue(+1, toRange: toRange)
        
        // Assert
        
        XCTAssertEqual(-100, scaledMin)
        XCTAssertEqual(+100, scaledMax)
        
    }
    
    
    
    func testScaleFromRange() {
        
        // Arrange
        
        guard
            let toRange = ContinuousRange(min: -1, max: +1),
            let fromRange = ContinuousRange(min: -100, max: +100) else {
                preconditionFailure()
        }
        
        // Act
        
        let scaledMin = toRange.scaleValue(-100, fromRange: fromRange)
        let scaledMax = toRange.scaleValue(+100, fromRange: fromRange)
        
        // Assert
        
        XCTAssertEqual(-1, scaledMin)
        XCTAssertEqual(+1, scaledMax)
        
    }
    
}
