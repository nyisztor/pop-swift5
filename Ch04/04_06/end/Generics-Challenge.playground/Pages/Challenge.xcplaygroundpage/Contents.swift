/*:
 # [Protocol-Oriented Programming in Swift 5](https://www.amazon.com/dp/B08N1MKHPT)
 ## Exercise Files
 ### 4.6 Challenge: Implementing a Generic Stack
 * * * * *
 
 **The stack is a sequential container, that provides a Last-In-First-Out (LIFO) access.
 We can push new items onto the top of the stack. Accessing the most recently added is possible using peek() or pop().**
 
 * * * * *
 Your task is to implement a generic Stack that exposes the following methods and properties:
 - `push(element)`: adds the element to the top of the stack
 - `pop()`: returns and removes the top element from the stack; returns nil if the stack is empty
 - `peek()`: returns the top element or nil if the stack is empty
 - `count`: returns the number of elements in the stack
 - `isEmpty`: returns a Boolean value indicating whether the stack has no elements
 
 
 * * * * *
 ### Hints:
 - Start by defining the protocol.
 - The `count` and `isEmpty` properties should be readonly.
 - Then, create the `Stack` type that adopts the protocol.
 - You can use an array as underlying storage.
 */

import Foundation
