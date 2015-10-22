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

class ScaleTests: XCTestCase {
    
    func testInit() {
        
        // Arrange
        
        let scale = Scale(min: 0, max: 1)
        
        // Assert
        
        XCTAssertEqual(0, scale.min)
        XCTAssertEqual(1, scale.max)
        
    }
    
    func testEquatableTrue() {
        
        // Arrange
        
        let scale1 = Scale(min: 0, max: 1)
        let scale2 = Scale(min: 0, max: 1)
        
        // Assert
        
        XCTAssert(scale1 == scale2)
        
    }
    
    func testEquatableFalse() {
        
        // Arrange
        
        let scale1 = Scale(min: 1, max: 0)
        let scale2 = Scale(min: 0, max: 1)
        
        // Assert
        
        XCTAssert(scale1 != scale2)
        
    }
    
    func testConvertToScale() {
        
        // Arrange
        
        let fromScale = Scale(min: -1, max: +1)
        let toScale = Scale(min: -100, max: +100)
        
        // Act
        
        let scaledMin = fromScale.convert(-1, toScale: toScale)
        let scaledMax = fromScale.convert(+1, toScale: toScale)
        
        // Assert
        
        XCTAssertEqual(-100, scaledMin)
        XCTAssertEqual(+100, scaledMax)
        
    }
    
    
    
    func testConvertFromScale() {
        
        // Arrange
        
        let toScale = Scale(min: -1, max: +1)
        let fromScale = Scale(min: -100, max: +100)
        
        // Act
        
        let scaledMin = toScale.convert(-100, fromScale: fromScale)
        let scaledMax = toScale.convert(+100, fromScale: fromScale)
        
        // Assert
        
        XCTAssertEqual(-1, scaledMin)
        XCTAssertEqual(+1, scaledMax)
        
    }
    
}
