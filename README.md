# Launch time optimization

## Examples

- `AmimonoStaticPods` - use of [cocoapods-amimono](https://github.com/Ruenzuo/cocoapods-amimono) with complex set of pods
- `DependencyInjection` - dependency injection with compile-time resolve check and lazy creation of dependencies
- `LazySystemFrameworks` - demonstrates that using of many system frameworks does not affect launch time
- `OnlyObjcAtStart` - implementation of application that use only obj-classes at startup, but the rest of the code is written in swift and loaded lazily. So, swift libs are not loaded at start
- `SystemLibsObjcWrappers` - examples of objc-wrappers for some parts of AVFoundation, CoreLocation, MapKit
- `TestAppOptimization` - four-step process of swift project launch time opmization (see presentation slides)

## Utilities

- `LibsListParser` - parse and compare two lists of dynamic libs loads. Just 
    1. enable "Dynamic Library Loads" in Xcode "Edit scheme"->"Diagnostings", 
    2. build & run
    3. copy console log of application startup to file
    4. repeat for other project (for example, empty project)
    5. call $./libs-list-parser.swift first second

## Contacts

Likhogrud Nikolay\
Yandex Mobile Maps iOS developement team lead\
likhogrud@yandex-team.ru
