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

private let _pairs: [(String, IntMax)] = _orderedPairs().filter({ $0.0 != "M" })

private func _numeralPairs<I: IntegerType>() -> [String: I] {
    return [
        "M":  1000,
        "CM": 900,
        "D":  500,
        "CD": 400,
        "C":  100,
        "XC": 90,
        "L":  50,
        "XL": 40,
        "X":  10,
        "IX": 9,
        "V":  5,
        "IV": 4,
        "I":  1
    ]
}

private func _orderedPairs<I: IntegerType>() -> [(String, I)] {
    return _numeralPairs().sort({ $0.1 > $1.1 })
}

private func _combine<I: IntegerType>(first: I?, _ second: I?) -> I? {
    guard let valueA = first, valueB = second else {
        return nil
    }
    return valueA + valueB
}

extension String {

    private subscript(range: Range<Int>) -> String {
        return self[startIndex.advancedBy(range.startIndex)
            ..< startIndex.advancedBy(range.endIndex)]
    }

    /// Create a Roman numeral string from an integer in its most compact form.
    ///
    /// If the integer is `<= 0`, an empty string is created.
    public init<I: IntegerType>(roman integer: I) {
        let int = integer.toIntMax()
        if int >= 1000 {
            let values = Repeat(count: Int(int / 1000), repeatedValue: "M")
            self = values.reduce("", combine: +)
                +  String(roman: integer % 1000)
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

extension IntegerType {

    /// Create an integer from a valid Roman numeral string.
    public init?(roman numeral: String) {

        guard !numeral.isEmpty else {
            return nil
        }

        typealias Integer = Self
        let pairs: [String: Self] = _numeralPairs()

        func createFrom(numeral: String) -> Integer? {
            guard !numeral.isEmpty else {
                return 0
            }
            for index in [2, 1] {
                let count = numeral.characters.count
                guard index <= count else {
                    continue
                }
                let head = numeral[0 ..< index]
                guard let value = pairs[head] else {
                    continue
                }
                let rest = numeral[index ..< count]
                if !rest.isEmpty {
                    let partValue = rest.characters.count >= 2
                        ? (pairs[rest[0 ..< 2]] ?? pairs[rest[0 ..< 1]])
                        : pairs[rest[0 ..< 1]]
                    guard partValue <= value else {
                        return nil
                    }
                }
                return _combine(value, createFrom(rest))
            }
            return nil
        }

        guard let value = createFrom(numeral.uppercaseString) else {
            return nil
        }
        self = value
    }

    /// Create an integer from a valid Roman numeral string.
    public init?(roman numeral: String?) {
        guard let value = numeral.flatMap({ Self(roman: $0) }) else {
            return nil
        }
        self = value
    }
    
}
