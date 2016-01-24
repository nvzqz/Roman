//
//  RomanTests.swift
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

import XCTest
import Roman

class RomanTests: XCTestCase {

    let examples = [
        (0,    ""),
        (1,    "I"),
        (2,    "II"),
        (3,    "III"),
        (4,    "IV"),
        (5,    "V"),
        (6,    "VI"),
        (7,    "VII"),
        (8,    "VIII"),
        (9,    "IX"),
        (10,   "X"),
        (14,   "XIV"),
        (15,   "XV"),
        (19,   "XIX"),
        (20,   "XX"),
        (40,   "XL"),
        (44,   "XLIV"),
        (50,   "L"),
        (51,   "LI"),
        (93,   "XCIII"),
        (100,  "C"),
        (150,  "CL"),
        (320,  "CCCXX"),
        (500,  "D"),
        (550,  "DL"),
        (1000, "M"),
        (3000, "MMM"),
        (4124, "MMMMCXXIV")
    ]

    func testNumeralFromInteger() {
        for (integer, numeral) in examples {
            XCTAssertEqual(String(roman: integer), numeral)
        }
    }

    func testIntegerFromNumeral() {
        for (integer, numeral) in examples {
            XCTAssertEqual(Int(roman: numeral) ?? 0, integer)
        }
    }

    func testInvalidNumerals() {
        let invalid = [
            "IVV",
            "IVX",
            "IXX",
            "IIX",
            "Hello",
            "XXM"
        ]
        for numeral in invalid {
            XCTAssertNil(Int(roman: numeral))
        }
    }

}
