//
//  TableViewCell.swift
//  KriptoParaUygulamasi
//
//  Created by Enes Kaya on 26.10.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let countryCurrencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addViews(){
        backgroundColor = UIColor.white
        
        
        addSubview(countryNameLabel)
        addSubview(countryCurrencyLabel)
        
        
        countryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        countryNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        countryNameLabel.textAlignment = .center

        countryCurrencyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryCurrencyLabel.leftAnchor.constraint(equalTo: countryNameLabel.rightAnchor, constant: 10).isActive = true
        countryCurrencyLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
