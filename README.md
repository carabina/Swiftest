Swiftest
========

Current Version: 0.1.0

_A 100% pure Swift, Foundation-less, XCTest-less BDD framework._

## Features
* runs on Linux and Mac
* familiar syntax inspired by RSpec and Jasmine
* natural, readable assertions for most Swift core types
* works with Swift generics (compatible with objects implementing `Equatable` or `Comparable`)
* free of dependencies (except LibC)
* before/after suite / spec hooks
* command-line client
* extensible
* [coming soon] customizable formatters
* [coming soon] multiple formatters

To see all the available assertions and features available, check out the [example project](src/Example).

## Installation
Swiftest can be installed using the Swift package manager.

```swift
.Package(url: "https://github.com/bppr/Swiftest.git", majorVersion: 0, minorVersion: 1)
```

For further instructions on installing and configuring Swiftest, see the [wiki page](github.com/bppr/Swiftest/wiki/Installation).
