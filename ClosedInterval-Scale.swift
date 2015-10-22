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

import QuartzCore

extension ClosedInterval where Bound: Scaleable {
    
    func scale(value: Bound, toInterval: ClosedInterval) -> Bound {
        
        func interpolate(value: Bound) -> Bound {
            return toInterval.start * (1 - value) + toInterval.end * value
        }
        
        func uninterpolate(value: Bound) -> Bound {
            return (value - start) / (end - start)
        }
        
        return interpolate(uninterpolate(value))
        
    }
    
    func scale(value: Bound, fromInterval: ClosedInterval<Bound>) -> Bound {
        return fromInterval.scale(value, toInterval: self)
    }
    
}

protocol Scaleable: IntegerLiteralConvertible {
    
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    
}

extension Double: Scaleable {}
extension Float: Scaleable {}
extension CGFloat: Scaleable {}
