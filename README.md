# iOSCleanArchitecture
iOSCleanArchitecture is a template project that conforms a MVVM architecture focused in big projects buildings. It includes great features like UIKit, Combine, AsyncAwait, UseCases/Repositories and much more

## General explanation

Clean architecture is not a new concept as we can see here:

![CleanArchitecture](https://user-images.githubusercontent.com/56566735/202541752-2d7d0acc-118d-4a9e-b2cc-60020dcae4b5.jpeg)

Basically we have to be clear about one concept and that is Dependency we have to isolate the dependencies of our code between layers to isolate and create only one direction of dependencies that goes from the outermost layer to the innermost layer.

## Project structure

Just as the description of the layer system must specify and describe what each of these does, we must translate to our project the same behavior. To do this we will create a series of folders that will contain the logic of each of these layers.

### Main folders

This would be the distribution of folders that will contain our project:

```
├── Core
├── Data
├── DI
├── Domain
└── Presentation
```

### Detailed overview and description

Each of these components has a function and should not be mixed with each other. Being clear about where each of the logics we implement should go:

```
├── Core
├── Data
|   ├── DTO
│   └── Repository
├── Di
├── Domain
│    ├── UseCase
│    └── Entity
└── Presentation
    ├── App
    └── Modules
```

- **Core**: This layer is responsible for storing all those components that are common to all layers. For example: constants, configuration data etc.

- **Data**: This layer is the one that will contain all the components that are in charge of obtaining and storing information.
    - **DTO**: we will store all the Data Transfer Object (DTO).
    - **Repository**: contains all implementations to obtain data either from an API or from a database.
    
- **DI**: This layer contains the dependency injection of our project that is used throughout the app. In our case it will contain the Container.swift that contains all the dependencies of the project.

- **Domain**: This layer is in charge of defining entities and use cases per Domain.
    - **Entity**: These are models used beyond the DTO to manage database or core data.
    - **UseCase**: List all the functionalities of our application. Example: Get, Delete, Create, Update.
    
- **Presentation**: The presentation layer will keep everything related to UI and its management.

### Presentation layer - Modules

Each module is composed by a series of files that must be implemented in each one of them:

```
└── Presentation
    └── Modules
        ├── ToDoBuilder
        ├── ToDoProtocols
        ├── ToDoRouter
        ├── ToDoViewModel
        ├── ToDoViewController
        └── ToDoViewController(UI)
```

- **Builder**: Constructor of the viewController and its dependencies.

- **Protocols**: Responsible for declaring all protocols to be used in the application.   

- Router**: Responsible for the navigation by the controller

- **ViewController**: UI controller to manage the module logic

- **ViewController(xib)**: Visual layer of the controller

## Author

Fernando Salom

https://fernandosalom.es

https://www.linkedin.com/in/fsalom/

## Co-author

Miguel Ferrer

https://www.linkedin.com/in/miguel-ferrer-fornali-6145b017a/

## Licence
[MIT](https://choosealicense.com/licenses/mit/)
