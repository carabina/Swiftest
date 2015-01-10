# Installation
*(Cocoapods beta installation coming soon!)*

## SwiftestXC
*Swiftest requires Xcode version 6.1.1 or higher.*

1. Clone the Swiftest project into your existing workspace's code directory.
2. Add `SwiftestXC.xcodeproj` to your workspace.
3. Select your test target and add `SwiftestCore.framework` and `SwiftestXC.framework` in the "Link Binary With Libraries" under "Build Phases"
4. Add a spec file. Inherit from `SwiftestSpec`, add a `describe` block and start writing specs!
