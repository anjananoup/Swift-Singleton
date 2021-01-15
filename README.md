# Swift-Singleton

Singleton Design Pattern Example Step by Step using Swift

Content:
1. Why We need Singleton
2. Simple Singleton Example
3. Multi Thread Singleton Problem
4. Thread Safe Singleton Example


## Common Singleton Problems:

When discussing things like patterns and architecture, it's easy to fall into the trap of being a bit too theoretical. While it's nice to have our code be theoretically "correct" and to follow all the best practices and principles - reality often hits and we need to find some sort of middle ground.

So what concrete problems are singletons usually causing, and why should they be avoided? The three main reasons why I tend to avoid singletons are:

## ** They are global mutable shared state. Their state is automatically shared across the entire app, and bugs can often start occurring when that state changes unexpectedly.

## ** The relationships between singletons and the code that depends on them is usually not very well defined. Since singletons are so convenient and easy to access - using them extensively usually leads to very hard to maintain "spaghetti code" that doesn't have clear separations between objects.

## ** Managing their lifecycle can be tricky. Since singletons are alive during the entire lifespan of an application, managing them can be really hard, and they usually have to rely on optionals to keep track of values. This also makes code that relies on singletons really hard to test, since you can't easily start from a "clean slate" in each test case.


## Solutions:

## ** Create an interface and a default implementation of your singleton

## ** Construct a single instance of your default implementation at the “top” of your system. This might be in a Spring config, or in code, or defined in a variety of ways depending on your system.

## ** Pass the single instance into each component that needs it (dependency injection)
