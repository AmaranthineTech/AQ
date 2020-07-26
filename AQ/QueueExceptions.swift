//
//  QueueExceptions.swift
//  AMRQueue
//
//  Created by Arun Patwardhan on 02/07/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

/**
 Exceptions for Queue
 
 *values*
 
 `ElementNotFound(String)`
 
 Thrown when the element being searched is not present
 
 `Empty(String)`
 
 Thrown when an action is being performed on an empty queue.
 
 - Author: Arun Patwardhan
 - Version: 1.0
 - Date: 20th July 2019
 
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
public enum QueueExceptions : Error
{
    case ElementNotFound(String)
    case Empty(String)
    case IndexOutOfBounds(String)
}









