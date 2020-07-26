/**
 AMRQueue<Element> class represents the entire queue
 
 **Variables**
 
 `startNode`
 
 Represents the starting node in the queue.
 
 `lastNode`
 
 Represents the last node in the queue.
 
 `size`
 
 Represents the size of the queue.
 
 **Functions**
 
 `func add(Element newElement : Element)`
 
 Used to add an element in the Queue
 
 `func remove() throws -> Element?`
 
 Removes the first element in the queue
 
 `func search(forElement searchElement : Element, with task : SearchClosure) throws -> Bool`
 
 Used to search for an element in the Queue
 
 `func emptyQueue() throws`
 
 Used to empty the queue
 
 `func map(with afterTransformation : (Element) -> Element) -> AMRQueue`
 
 Used to map individual elements of a function to a new value
 
 - Author: Arun Patwardhan
 - Version: 1.0
 - Date: 20th July 2019
 
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
public final class AMRQueue<Element>
{
    //Variables --------------------------------------------------
    fileprivate var startNode   : Node<Element>?    = nil
    public var size             : UInt64            = 0
    fileprivate var lastNode    : Node<Element>?    = nil
    
    //Functions --------------------------------------------------
    public init()
    {
        
    }
    
    /**
     This function adds an element to the end of the queue
     - important: This function does not do validation.
     - returns: Void.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11, message: "Use this to add elements to a Node")
    public func add(Element newElement : Element)
    {
        //1. Create a node
        let newNode : Node<Element> = Node<Element>(with: newElement)
        
        //2. Add node to queue
        if nil == startNode
        {
            startNode = newNode
        }
        else
        {
            lastNode?.nextNode = newNode
        }
        size += 1
        lastNode = newNode
    }
    
    /**
     This function removes the first element from the queue
     - important: This function throws an Exception if you try to remove from an empty queue
     - note: The reason why the return type is an optional is because the node may or may not hold data. A return value of `nil` indicates that there is a node, but the node is empty.
     - returns: `Element?`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    @discardableResult public func remove() throws -> Element?
    {
        guard nil != startNode
            else
        {
            throw QueueExceptions.Empty("The queue is empty")
        }
        let returnNode = startNode
        startNode = startNode?.nextNode
        returnNode?.nextNode = nil
        size -= 1
        return returnNode?.data
    }
}

//:#### Extension to Queue Class
/**
 Adds search capability.
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension AMRQueue
{
    /**
     Closure Type used for searching
     
     *Arguments*
     
     Takes 2 arguments both of type element
     
     *Returns*
     
     `Bool`. True indicates a match.
     
     - Author: Arun Patwardhan
     - Version: 1.1
     */
    public typealias SearchClosure = (Element, Element) -> Bool
    
    /**
     This function searches for the given element in the queue
     - important: This function throws an Exception if you try to search from an empty queue
     - returns: `Bool`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    public func search(forElement searchElement : Element, with task : SearchClosure) throws -> SearchResult
    {
        guard nil != startNode
            else
        {
            throw QueueExceptions.Empty("Cannot search. The queue is Empty.")
        }
        
        var searchNode : Node<Element>? = startNode
        for _ in 0..<size
        {
            guard nil != searchNode
            else
            {
                break
            }
            if nil != searchNode!.data
            {
                if task(searchElement, searchNode!.data!)
                {
                    return SearchResult.ElementFound
                }
            }
            searchNode = searchNode!.nextNode
        }
        return SearchResult.ElementNotFound
    }
}

//:#### Extension to Queue Class
/**
 Adds the following capabilities.
 ````
 +
 +=
 ````
 
 - Author: Arun Patwardhan
 - Version: 1.2
 */
extension AMRQueue
{
    /**
     This function overloads the `+` operator for the Queue. This function takes 2 Queues and combines them to form a new Queue.
     - returns: `AMRQueue`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    public static func +(lhs : AMRQueue, rhs : AMRQueue) -> AMRQueue
    {
        let resultingQueue : AMRQueue = AMRQueue()
        
        var iteratorNode : Node<Element>? = lhs.startNode
        
        for _ in 0..<lhs.size
        {
            guard nil != iteratorNode
                else
            {
                break
            }
            if nil != iteratorNode!.data
            {
                resultingQueue.add(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
            
        }
        
        iteratorNode = rhs.startNode
        
        for _ in 0..<rhs.size
        {
            guard nil != iteratorNode
                else
            {
                break
            }
            if nil != iteratorNode!.data
            {
                resultingQueue.add(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
            
        }
        return resultingQueue
    }
    
    /**
     This function overloads the `+=` operator for the Queue. This function takes 2 Queues and adds the contents of the second queue to your first queue.
     - returns: `Bool`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    public static func +=(lhs : inout AMRQueue, rhs : AMRQueue)
    {
        var iteratorNode : Node<Element>? = rhs.startNode
        
        for _ in 0..<rhs.size
        {
            guard nil != iteratorNode
                else
            {
                break
            }
            if nil != iteratorNode!.data
            {
                lhs.add(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
        }
    }
}

//:#### Extension to Queue Class
/**
 Adds the following capabilities.
 ````
 empty queue
 ````
 
 - Author: Arun Patwardhan
 - Version: 1.3
 */
extension AMRQueue
{
    /**
     This function removes all the elements from the queue
     - important: This function throws an Exception if you try to remove from an empty queue
     - returns: `Void`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove all Elements Function")
    public func emptyQueue() throws
    {
        guard nil != startNode
            else
        {
            throw QueueExceptions.Empty("The queue is empty")
        }
        
        for _ in 0..<size
        {
            let nodeToBeRemoved = startNode
            startNode = startNode?.nextNode
            nodeToBeRemoved?.nextNode = nil
        }
        
        size = 0
    }
}

//:#### Extension to Queue Class
/**
 Adds conformance to the CustomStringConvertible protocol
 
 - Author: Arun Patwardhan
 - Version: 1.4
 */
extension AMRQueue : CustomStringConvertible
{
    public var description: String {
        var returnString : String = ""
        if nil != startNode
        {
            var searchNode : Node<Element>? = startNode
            for i in 0..<size
            {
                guard nil != searchNode else { break }
                if nil != searchNode!.data
                {
                    returnString += "[\(i)]: \(searchNode!.data!)\n"
                }
                searchNode = searchNode!.nextNode
            }
        }
        return returnString
    }
}

//:#### Extension to Queue Class
/**
 Adds the Equatable behavior.
 
 - Author: Arun Patwardhan
 - Version: 1.5
 */
extension AMRQueue : Equatable where Element : Equatable
{
    public static func == (lhs: AMRQueue<Element>, rhs: AMRQueue<Element>) -> Bool {
        var lhsFirstValue : Element?
        var rhsFirstValue : Element?
        
        lhsFirstValue = lhs.first
        rhsFirstValue = rhs.first
        
        if lhs.size == rhs.size && lhsFirstValue == rhsFirstValue
        {
            return true
        }
        return false
    }
}

//:#### Extension to Queue Class
/**
 Adds the following Indexing & subscripting.
 
 - Author: Arun Patwardhan
 - Version: 1.6
 */
extension AMRQueue
{
    public typealias Index = Int
    
    /**
     This computed property returns the starting index of the queue
     - returns: `Index`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Starting index of the queue.")
    public var startIndex : Index
    {
        return 0
    }
    
    /**
     This computed property returns the last index of the queue
     - returns: `Index`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Last index of the queue.")
    public var endIndex: Index
    {
        return Int(size)
    }
    
    /**
     Enables subscripting behavior.
     - important: Note that the index for a queue also starts from `0` just like an array.
     - returns: Generic type `Element`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Subscripting")
    public subscript (position : Index) -> Element
    {
        get
        {
            var referenceNode = startNode
            for _ in 0..<position
            {
                referenceNode = referenceNode?.nextNode
            }
            return (referenceNode?.data!)!
        }
    }
}

//:#### Extension to Queue Class
/**
 Adds conformance to the sequence protocol
 
 - Author: Arun Patwardhan
 - Version: 1.7
 */
extension AMRQueue : Sequence
{
    public typealias Iterator = AnyIterator<Element>
    
    /**
     This function returns an iterator which is used to iterate over the collection.
     - returns: `Iterator`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Iterator creation function")
    public func makeIterator() -> Iterator
    {
        var index = 0
        return AnyIterator({() -> Element? in
            if index < self.size
            {
                var referenceNode = self.startNode
                for _ in 0..<index
                {
                    referenceNode = referenceNode?.nextNode
                }
                let res =  referenceNode?.data
                index += 1
                return res
            }
            return nil
        })
    }
}

//:#### Extension to Queue Class
/**
 Adds conformance to the sequence protocol
 
 - Author: Arun Patwardhan
 - Version: 1.8
 */
extension AMRQueue : Collection
{
    public typealias SubSequence = AMRQueue<Element>
    
    /**
     Enables subscripting behavior over a range of values.
     - returns: A subset of the queue `AMRQueue.SubSequence`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    public subscript (bounds: Range<AMRQueue.Index>) -> AMRQueue.SubSequence
    {
        let newQueue : AMRQueue<Element> = AMRQueue<Element>()
        
        for i in bounds.lowerBound...bounds.upperBound
        {
            var referenceNode = self.startNode
            for _ in 0..<i
            {
                newQueue.add(Element: (referenceNode?.data)!)
                referenceNode = referenceNode?.nextNode
            }
            
        }
        return newQueue
    }
    
    /**
     This function returns the position immediately after the given index.
     - returns: The index value immediately after `i`.
     - parameter i: A valid index of the collection. `i` must be less than `endIndex`.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Iterator creation function")
    public func index(after i: Int) -> Int
    {
        if i < endIndex
        {
            return i + 1
        }
        return i
    }
}

//:#### Extension to Queue Class
/**
 Adds computed properties to get first and last element
 
 - Author: Arun Patwardhan
 - Version: 1.9
 */
extension AMRQueue
{
    public var first: Element? {
        guard nil != startNode
        else { return nil }
        return startNode?.data
    }
    
    public var last: Element? {
        guard nil != startNode
            else { return nil }
        return lastNode?.data
    }
}
