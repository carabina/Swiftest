# Installation
*(Cocoapods beta installation coming soon!)*

## SwiftestXC

### via Git clone
*requires Xcode version >= 6.1.1*

To install SwiftestXC to an existing project:

1. Clone the Swiftest project into your existing workspace's code directory.
2. Add `src/SwiftestXC/SwiftestXC/SwiftestXC.xcodeproj` to your workspace.
3. Select your test target and add `SwiftestCore.framework` and `SwiftestXC.framework` in the "Link Binary With Libraries" under "Build Phases"
4. Add a spec file. Inherit from `SwiftestSpec`, add a `describe` block and start writing specs!
5. Run tests as you normally would with Xcode (Cmd+U by default)

To install SwiftestXC file templates:

1. `cd` to the Swiftest installation directory and run `./etc/install_templates`
2. Restart Xcode
