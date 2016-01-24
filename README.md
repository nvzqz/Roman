<p align="center">
    <img
    src="https://raw.githubusercontent.com/nvzqz/Roman/master/Assets/banner.png"
    alt="Roman Banner">
</p>

<p align="center">
    <img src="https://img.shields.io/badge/platform-osx%20%7C%20ios%20%7C%20watchos%20%7C%20tvos%20%7C%20linux-lightgrey.svg?style=flat-square"
         alt="Platform">
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/SPM-compatible-orange.svg?style=flat-square"
             alt="Swift Package Manager">
    </a>
    <a href="https://cocoapods.org/pods/Roman">
        <img src="https://img.shields.io/cocoapods/v/Roman.svg?style=flat-square"
             alt="CocoaPods">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square"
             alt="Carthage">
    </a>
    <img src="https://img.shields.io/badge/license-MIT-000000.svg?style=flat-square"
         alt="MIT License">
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
