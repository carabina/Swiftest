Swiftest
========

[![wercker status](https://app.wercker.com/status/90bfae733696f02ab6d2c0d6ad81b5fe/m/master "wercker status")](https://app.wercker.com/project/bykey/90bfae733696f02ab6d2c0d6ad81b5fe)

Current Version: 0.1.2

_A 100% pure Swift, Foundation-less, XCTest-less BDD framework._

## Features
* runs on Linux and Mac
* familiar syntax inspired by RSpec and Jasmine
* natural, readable assertions for most Swift core types
* works with Swift protocols (compatible with objects implementing `Equatable` or `Comparable`)
* free of dependencies (except LibC)
* before/after suite / spec hooks
* command-line client
* extensible
* [coming soon] customizable formatters
* [coming soon] multiple formatters

To see all the available assertions and features available, check out the [example project](src/Example).

## Installation
Swiftest can be installed using the Swift package manager. Add this line to your `Package.swift` file to install the latest version.

```swift
.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,2))
```

For further instructions on installing and configuring Swiftest, see the [wiki page](https://github.com/bppr/Swiftest/wiki/Installation).
