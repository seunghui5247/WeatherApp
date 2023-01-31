//
//  MainViewController.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit
import CoreLocation

class MainViewController: BaseViewController {
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, tempLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    private lazy var tempStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [maxTempLabel, minTempLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            labelStackView, tempStackView
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    var locationManager: CLLocationManager!
    
    var latitude: Double?
    var longitude: Double?
    var apiKey = "7cecc91107317b855b34f68b7abf470b"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        constraints()
    }
}

extension MainViewController {
    private func constraints() {
        vStackViewConstraints()
        labelStackViewConstraints()
        tempStackViewConstraints()
    }
    
    private func vStackViewConstraints() {
        self.view.addSubview(vStackView)
        self.vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = [
            self.vStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.vStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.vStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.vStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(layout)
    }
    
    private func labelStackViewConstraints() {
        self.labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = [
            self.labelStackView.topAnchor.constraint(equalTo: vStackView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(layout)
    }
    
    private func tempStackViewConstraints() {
        self.tempStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = [
            self.tempStackView.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 30),
        ]
        
        NSLayoutConstraint.activate(layout)
    }
}

extension MainViewController {
    func setCurrentData(data: WeatherType) {
        tempLabel.text = String(Int(data.current.temp)) + "°"
        descriptionLabel.text = data.current.weather[0].description
        maxTempLabel.text = "최고:\(Int(data.daily[0].temp.max))°"
        minTempLabel.text = "최저:\(Int(data.daily[0].temp.min))°"
    }
}
