//
//  DailyCell.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

class DailyCell: UITableViewCell {
    static let cellId = "DailyCell"
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let maxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func layout() {
        self.addSubview(dayLabel)
        self.addSubview(weatherImageView)
        self.addSubview(minLabel)
        self.addSubview(maxLabel)
        
        dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        dayLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        weatherImageView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 20).isActive = true
        weatherImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 13).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        minLabel.trailingAnchor.constraint(equalTo: maxLabel.leadingAnchor, constant: -20).isActive = true
        minLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        minLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        maxLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        maxLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        maxLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
