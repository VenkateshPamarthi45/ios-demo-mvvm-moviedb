//
//  MainAssembler.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 10/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Swinject

class MainAssembler{
    
    var resolver: Resolver{
        return assembler.resolver
    }
    let assembler = Assembler()
    init() {
        assembler.apply(assemblies: [MovieListingViewModelImplAssembly(), MovieRepositoryImplAssembly()])
    }
    
}
