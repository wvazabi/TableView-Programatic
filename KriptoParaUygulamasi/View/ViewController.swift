//
//  ViewController.swift
//  KriptoParaUygulamasi
//
//  Created by Atil Samancioglu on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    
    let myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tableView.delegate = self
        //tableView.dataSource = self
        for _ in 1...50 {
            let randomCurrency = "Crypto\(arc4random_uniform(1000))"
            let randomPrice = "\(Double(arc4random_uniform(1000) + 1))"
            let crypto = Crypto(currency: randomCurrency, price: randomPrice)
            cryptoList.append(crypto)
        }
        
        setupUITableView()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        setupBindings()
        cryptoVM.requestData()
        view.backgroundColor = .green
       
        print(cryptoList)
        
        
       
    }
    private func setupUITableView() {
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "countryCell")
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
    }
    
    

    private func setupBindings() {
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
            //    self.cryptoList = cryptos
            //    self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
   
        cryptoVM
            .loading
            //.bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
            }.disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! TableViewCell
        
        cell.countryNameLabel.text = cryptoList[indexPath.row].currency
        cell.countryCurrencyLabel.text = cryptoList[indexPath.row].price
        return cell
    }


}

