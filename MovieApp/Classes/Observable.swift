//
//  Observable.swift
//  MovieApp
//
//  Created by Kshitija Shaktawat on 7/6/23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init( _ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind( listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
