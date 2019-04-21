# The MVVM with Swift

This sample project is to explain about [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel).

Its main goal is to follow the [SOLID principles](https://en.wikipedia.org/wiki/SOLID) in order to keep the software well organised, testable, easy to maintain and more importantly easy to extend/change.

As explained in the posts above and in [the book](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164), databases, network clients and frameworks are abstracted in the upper layers (Entities, Data and Domain layers) and should not be imported/referenced into them, instead they should be injected in the App level as dependencies through the interfaces exposed by the upper layers.
![mvvm](https://user-images.githubusercontent.com/32227073/56474411-c6ae0c80-644f-11e9-9475-64805372e569.jpg)

## Modules

In this sample app we have the following modules/layers:

### DependencyInjector
		
Framework responsible for linking the Interfaces to the `Factories`. This should only the referenced/used in the `App Module`.

### Model

Model refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content (a data-centric approach

### View

As in the model-view-controller (MVC) and model-view-presenter (MVP) patterns, the view is the structure, layout, and appearance of what a user sees on the screen. It displays a representation of the model and receives the user's interaction with the view (clicks, keyboard, gestures, etc.), and it forwards the handling of these to the view model via the data binding (properties, event callbacks, etc.) that is defined to link the view and view model.
### View Model

The view model is an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder, which automates communication between the view and its bound properties in the view model. The view model has been described as a state of the data in the model
The main difference between the view model and the Presenter in the MVP pattern, is that the presenter has a reference to a view whereas the view model does not. Instead, a view directly binds to properties on the view model to send and receive updates. To function efficiently, this requires a binding technology or generating boilerplate code to do the binding.

### Binder
Declarative data and command-binding are implicit in the MVVM pattern. In the Microsoft solution stack, the binder is a markup language called XAML.[8] The binder frees the developer from being obliged to write boiler-plate logic to synchronize the view model and view. When implemented outside of the Microsoft stack, the presence of a declarative data binding technology is what makes this pattern possible, and without a binder, one would typically use MVP or MVC instead and have to write more boilerplate (or generate it with some other tool).

## Getting Started
In this project you can see the traditional form to make that using MVC, but also you can see the way using MVVM

### Prerequisites
- Xcode 10.1
- iOS 12
- Swift 4.2

### Installing


```

```



```

```

You may now open `MVVM.xcworkspace`, select the `App` target and run it.
