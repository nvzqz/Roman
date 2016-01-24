<p align="center">
    <img
    src="https://raw.githubusercontent.com/nvzqz/Roman/master/Assets/banner.png"
    alt="Roman Banner">
</p>

Roman numerals in Swift.

## Usage

### String

A Roman numeral string can be created from an instance of a type that conforms
to `IntegerType`.

```swift
String(roman: 1478)  // "MCDLXXVIII"
String(roman: 2743)  // "MMDCCXLIII"
String(roman: 1226)  // "MCCXXVI"
String(roman: 0)     // ""
String(roman: -42)   // ""
```

### IntegerType

All types that conform to `IntegerType` can be initialized from a Roman numeral
string.

The input string is case insensitive.

```swift
Int(roman: "III")  // 3
Int(roman: "MIV")  // 1004
Int(roman: "CdV")  // 405
```

Roman even supports irregular numerals that don't use a short form.

Each of the following evaluate to `true`:

```swift
Int(roman: "IV") == Int(roman: "IIII")
Int(roman: "XX") == Int(roman: "VVVV")
Int(roman: "CD") == Int(roman: "CCCC")
```

Invalid strings return `nil`.

```swift
Int(roman: "hello") == nil
Int(roman: "IIIXX") == nil
Int(roman: "XYZ")   == nil
```

## License

Roman is released under the [MIT License](https://opensource.org/licenses/MIT).

All assets are released under the Creative Commons [Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/)
and can be found in the [Assets](https://github.com/nvzqz/Roman/tree/master/Assets)
folder.
