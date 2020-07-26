//
//  Node.swift
//  AMRQueue
//
//  Created by Arun Patwardhan on 02/07/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

/**
 Node<Element> class represents a single node.
 
 *Parameters*
 
 `data`          Represents the data stored in the Node.
 
 `nextNode`      Represents the next node in the queue.
 
 - Author: Arun Patwardhan
 - Version: 1.0
 - Date: 20th July 2019
 
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
final class Node<Element>
{
    var data    : Element?
    
    var nextNode            : Node<Element>?
    
    init(with newData : Element) {
        data = newData
    }
}







