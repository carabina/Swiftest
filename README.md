Swiftest
========

A dirt-simple, kinda bare-bones implementation of a behavior-driven-development
framework in Swift.

Swiftest is written in pure Swift, and has no external dependencies.
Not even on Foundation. Just needs a Swift compiler.  It's purposely minimal
because we're not sure what we'll get from Linux-based Swift. Side note, if
you're looking for something to test an iOS app, this probably is *not* the right
project for you at this time.

Swiftest uses the simplest aproach possible:
* compile an app target, made from a single concatenated Swift file
  that links against SwiftestCore and SwiftestClient
* run the app target

There's a script in here that will show you how to do that (see `run-test.sh`),
but I also plan to build a plugin for [Swish](https://github.com/bppr/swish)
that makes it a heck of a lot nicer to use moving forward.

For now, this sort of stands as a hacky proof-of-concept for Swish and has done
a good job of informing me where that project needs to go.
