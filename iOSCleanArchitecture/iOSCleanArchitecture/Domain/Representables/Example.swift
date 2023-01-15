//
//  Example.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 20/11/22.
//

protocol ExampleRepresentable {
    var name: String { get }
}

struct ExampleRepresented: ExampleRepresentable {
    var name: String
    
    init(_ dto: ExampleDTO) {
        name = dto.name
    }
}
