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

<p align="center">
    <a href="#installation">Installation</a>
  • <a href="#usage">Usage</a>
  • <a href="#license">License</a>
  • <a href="https://nvzqz.github.io/Roman/docs/">Documentation</a>
</p>

Roman numerals in Swift.

## Installation

### Compatibility:

- Platforms:
    - OS X
    - iOS
    - watchOS
    - tvOS
    - Linux
- Language:
    - Swift 2.1+

### Install Using Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a
decentralized dependency manager for Swift.

1. Add the project to your `Package.swift`.

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeProject",
        dependencies: [
            .Package(url: "https://github.com/nvzqz/Roman.git",
                     majorVersion: 1)
        ]
    )
    ```

2. Import the Roman module.

    ```swift
    import Roman
    ```

### Install Using CocoaPods
[CocoaPods](https://cocoapods.org/) is a centralized dependency manager for
Objective-C and Swift. Go [here](https://guides.cocoapods.org/using/index.html)
to learn more.

1. Add the project to your [Podfile](https://guides.cocoapods.org/using/the-podfile.html).

    ```ruby
    use_frameworks!

    pod 'Roman', '~> 1.0'
    ```

2. Run `pod install` and open the `.xcworkspace` file to launch Xcode.

3. Import the Roman framework.

    ```swift
    import Roman
    ```

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "nvzqz/Roman"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add Roman to your project.

3. Import the Roman framework.

    ```swift
    import Roman
    ```

### Install Manually

Simply add the `Roman.swift` file into your project.

## Usage

### String

A Roman numeral string can be created from an instance of a type that conforms
to `IntegerType`.

```swift
String(roman: 1478)  // "MCDLXXVIII"
String(roman: 2743)  // "MMDCCXLIII"
String(roman: 1226)  // "MCCXXVI"
String(roman: 0)     // nil
String(roman: -42)   // nil
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

Each of the following evaluates to `true`:

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
