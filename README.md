# XCTestPlayground

This repository contains a simple implementation of most `XCTAssert` macros to use in a Playground.

With the Playground feature that display the result of an executed line, it will show the assert result like this:
![screenshot](screenshot.png)

I use this to do TDD directly inside a Playground and then move the code as-is inside my test files.

It also contains a XCTestCase base class that, when instantiated, will run all methods with names beginning with "test", to mimic XCTestCase behaviour and make moving the code to your Xcode project easier

## How to install

Simply add the Swift file to your Playground sources folder.
