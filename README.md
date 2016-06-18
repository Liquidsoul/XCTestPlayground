# XCTestPlayground

This repository contains a simple implementation of most `XCTAssert` macros to use in a Playground.

With the Playground feature that display the result of an executed line, it will show the assert result like this:
![screenshot](screenshot.png)

I use this to do TDD directly inside a Playground and then move the code as-is inside my test files.

It contains a `XCTestCase` base class that, when instantiated, will run all methods with names beginning with "test", to mimic XCTestCase behaviour and make moving the code to your Xcode project easier.

## How to install it in an existing playground

Simply add the `XCTestPlayground.swift` file to your Playground `Sources` folder.

## Using it directly

The repo contains a fully configured Xcode workspace containing a playground importing `XCTestPlayground`.
All you have to do is:

1. clone the repo
2. build the framework on a 64-bit target (e.g. iPhone 5s simulator)
3. go and play in the `XCTestPlaygroundExample` playground! 🎉

## Xcode 8 and Swift 3

Xcode 8 beta has been released and since it breaks source compatibility the changes cannot be pushed to the `master` branch _yet_.
As a result, I have created a [`swift3`](https://github.com/Liquidsoul/XCTestPlayground/tree/swift3) branch which contains the necessary changes to support Xcode 8 with Swift 3.
Please, checkout this branch if you intend to use `XCTestPlayground` in Xcode 8 :smiley:
