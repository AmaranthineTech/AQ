//
//  SearchResult.swift
//  AMRQueue
//
//  Created by Arun Patwardhan on 20/07/19.
//  Copyright © 2019 Amaranthine. All rights reserved.
//

import Foundation

/**
 Search results for Queue
 
 *values*
 
 `ElementNotFound`
 
 `ElementFound`
 
 `Empty`
 
 - Author: Arun Patwardhan
 - Version: 1.0
 - Date: 20th July 2019
 
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
public enum SearchResult
{
    case ElementFound
    case Empty
    case ElementNotFound
}

extension SearchResult
{
    /**
     This function returns a `String` version of the value.
     - returns: `String`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "String converter")
    public func toString() -> String
    {
        switch self {
        case .ElementFound:
            return "ElementFound"
        case .ElementNotFound:
            return "ElementNotFound"
        case .Empty:
            return "Empty"
        }
    }
}
