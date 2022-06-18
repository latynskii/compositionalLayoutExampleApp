//
//  CollectionViewPresenter.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 18.06.2022.
//

import Foundation

protocol CollectionViewProtocol: AnyObject {
    //TODO some ui settings
}

protocol CollectionViewPresenterProtocol {
    var sections: Sections?  { get }
    func fetchData(completion: @escaping(NetworkErrors?) -> ())
    
    init(_ view: CollectionViewProtocol)
}

class CollectionViewPresenter: CollectionViewPresenterProtocol {
    
    //MARK: - Properties
    weak var view: CollectionViewProtocol?
    var sections: Sections?
    private var networkManager: NetworkManagerProtocol?
    
    required init(_ view: CollectionViewProtocol) {
        self.view = view
        self.networkManager = NetworkManager()
    }
    
    //MARK: - Methods
    func fetchData(completion: @escaping(NetworkErrors?) -> ()) {
        networkManager?.loadData(completion: { result in
            switch result {
            case .success(let sections):
                self.sections = sections
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        })
    }
}
