# iOSCleanArchitecture
iOSCleanArchitecture is a template project that conforms a MVVM architecture focused in big projects buildings. It includes great features like UIKit, Combine, AsyncAwait, UseCases/Repositories, Demo/Develop/Production environments and much more

## General explanation

Clean architecture is not a new concept as we can see here:

![CleanArchitecture](https://user-images.githubusercontent.com/56566735/202541752-2d7d0acc-118d-4a9e-b2cc-60020dcae4b5.jpeg)

Basically we have to be clear about one concept and that is Dependency we have to isolate the dependencies of our code between layers to isolate and create only one direction of dependencies that goes from the outermost layer to the innermost layer

## Project structure

Just as the description of the layer system must specify and describe what each of these does, we must translate to our project the same behavior. To do this we will create a series of folders that will contain the logic of each of these layers

### Main folders

This would be the distribution of folders that will contain our project:

```
├── DI
├── Services
├── Data
├── Domain
└── Presentation
```

### Detailed overview and description

Each of these components has a function and should not be mixed with each other. Being clear about where each of the logics we implement should go:

```
├── DI
├── Services
│   ├── DB
│   └── API
├── Data
│   ├── DTO
│   └── Repositories
├── Domain
│    ├── BO
│    └── UseCases
└── Presentation
    ├── App
    ├── Components
    └── Scenes
```

- **DI**: This layer contains the main tree of dependency injection of our project that is used throughout the app

- **Services**: This layer is responsible for getting data from different environments like API, Local DB, Cache, etc

- **Data**: This layer is the one that will contain all the components that are in charge of obtaining and storing information
    - **DTO**: We will store all the Data Transfer Object (DTO)
    - **Repository**: Contains all implementations to obtain data either from an API or from a database, divided by scenes

- **Domain**: This layer is in charge of defining entities and use cases per Domain
    - **BO**: These are models used beyond the DTO to manage database or core data
    - **UseCases**: List all the functionalities of our application, divided by scenes. Example: Get, Delete, Create, Update
    
- **Presentation**: The presentation layer will keep everything related to UI and its management

### Presentation layer - Scenes

Each sceme is composed by a series of files that must be implemented in each one of them:

```
└── Scenes
    └── Home
        ├── Coordinator
        ├── Dependencies
        ├── Representables
        ├── ViewModel
        └── View
```

- **Coordinator**: Responsible for the scene navigation

- **Dependencies**: Scene dependencies needed to build the entire scene

- **Representables**: Protocols with needed parameters to print the UI layer, shared between ViewModel, ViewController and subviews

- **ViewModel**: Responsible for the communications between UseCases and View. Thanks to reactive Combine states

- **View**: Visual layer of the controller, starting with the ViewController and divided by subviews. Thanks to reactive Combine events

## Author

Fernando Salom

https://github.com/fsalom

https://www.linkedin.com/in/fsalom/

## Co-author

Miguel Ferrer

https://github.com/MiguelFerrer99

https://www.linkedin.com/in/miguel-ferrer-fornali-6145b017a/

## Licence
[MIT](https://choosealicense.com/licenses/mit/)
