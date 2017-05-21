# Launch time optimization

## Examples

- `AmimonoStaticPods` - use of [cocoapods-amimono](https://github.com/Ruenzuo/cocoapods-amimono) with complex set of pods
- `DependencyInjection` - dependency injection with compile-time resolve check and lazy creation of dependencies
- `LazySystemFrameworks` - demonstrates that using of many system frameworks does not affect launch time
- `OnlyObjcAtStart` - implementation of application that use only obj-classes at startup, but the rest of the code is written in swift and loaded lazily. So, swift libs are not loaded at start
- `SystemLibsObjcWrappers` - examples of objc-wrappers for some parts of AVFoundation, CoreLocation, MapKit
- `TestAppOptimization` - four-step process of swift project launch time opmization (see presentation slides)

## Contacts

Likhogrud Nikolay\
Yandex Mobile Maps iOS developement team lead\
likhogrud@yandex-team.ru\
