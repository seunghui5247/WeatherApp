//
//  HourlyCell.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

class HourlyCell: UICollectionViewCell {
    static let cellId = "HourlyCell"
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func layout() {
        self.addSubview(hourLabel)
        self.addSubview(weatherImageView)
        self.addSubview(tempLabel)
        
        hourLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        weatherImageView.topAnchor.constraint(equalTo: hourLabel.topAnchor, constant: 20).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tempLabel.topAnchor.constraint(equalTo: weatherImageView.topAnchor, constant: 30).isActive = true
        tempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    }
}
