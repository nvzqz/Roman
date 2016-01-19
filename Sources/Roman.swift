//
//  Roman.swift
//  Roman
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

private let _pairs: [(String, IntMax)] = [
    ("CM", 900),
    ("D",  500),
    ("CD", 400),
    ("C",  100),
    ("XC", 90),
    ("L",  50),
    ("XL", 40),
    ("X",  10),
    ("IX", 9),
    ("V",  5),
    ("IV", 4),
    ("I",  1)
]

private let _allPairs = [("M",  1000)] + _pairs

extension String {

    /// Create a Roman numeral string from an integer in its most compact form.
    public init<I: IntegerType>(roman integer: I) {
        let int = integer.toIntMax()
        if int >= 1000 {
            let values = Repeat(
                count: Int(int / 1000),
                repeatedValue: "M"
            )
            self = values.reduce("", combine: +) + String(roman: integer % 1000)
        } else {
            for (numeral, value) in _pairs {
                if int >= value {
                    self = numeral + String(roman: int - value)
                    return
                }
            }
            self = ""
        }
    }

}
