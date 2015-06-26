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

public struct ContinuousRange: Equatable {
    
    public let min: Double
    public let max: Double
    
    public init?(min preferredMin: Double, max preferredMax: Double) {
        
        guard preferredMin != preferredMax else {
            return nil
        }
        
        min = preferredMin
        max = preferredMax
        
    }
    
    public func scaleValue(value: Double, toRange: ContinuousRange) -> Double {
        
        func interpolate(value: Double) -> Double {
            return toRange.min * (1 - value) + toRange.max * value
        }
        
        func uninterpolate(value: Double) -> Double {
            return (value - min) / (max - min)
        }
        
        return interpolate(uninterpolate(value))
        
    }
    
    public func scaleValue(value: Double, fromRange: ContinuousRange) -> Double {
        
        return fromRange.scaleValue(value, toRange: self)
        
    }
    
}

public func ==(continuousRange: ContinuousRange, otherContinuousRange: ContinuousRange) -> Bool {
    
    let minEquals = continuousRange.min == otherContinuousRange.min
    let maxEquals = continuousRange.max == otherContinuousRange.max
    
    return minEquals && maxEquals
    
}
