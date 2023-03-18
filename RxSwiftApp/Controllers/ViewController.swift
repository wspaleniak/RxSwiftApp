//
//  ViewController.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Kontroler widoku
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        fillTableView()
    }
    
    // Metoda ta ustawia nam wizualne aspekty widoku
    private func setupViews() {
        navigationItem.title = viewModel?.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    // Metoda ta odpowiada za wypełnienie TableView danymi
    // Wywowłujemy tutaj metodę z ViewModel
    // fetchRestaurantViewModels() zwraca tablicę obiektów [RestaurantViewModel]
    // observe(on:) - pozwala na działanie na głównym wątku
    // bind(to:) - proces bindowania - closure z indexem cell'ki, obiektem z tablicy [RestaurantViewModel] oraz cell'ka
    // przekazujemy jako argument tableView.rx.items(cellIdentifier:) - trzeba pamiętać, żeby w storyboard dodać prototypową cellkę i nadać jej nazwę
    private func fillTableView() {
        viewModel?.fetchRestaurantViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, restaurant, cell in
                
                cell.textLabel?.text = restaurant.displayText
        }
        .disposed(by: disposeBag)
    }
}

