//
//  CollectionViewController.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainViewController.hourlyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCell.cellId, for: indexPath) as? HourlyCell else {
            return UICollectionViewCell()
        }
        
        let data = MainViewController.hourlyData
        
        if indexPath.row == 0 {
            cell.hourLabel.text = "지금"
        } else {
            cell.hourLabel.text = getTime(date: TimeInterval(data[indexPath.row].dt)) + "시"
        }
        
        cell.weatherImageView.image = UIImage(named: data[indexPath.row].weather[0].icon)
        cell.tempLabel.text = String(Int(data[indexPath.row].temp)) + "°"
        
        return cell
    }
    
    func getTime(date: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H"
        let time = dateFormatter.string(from: date)
        
        return time
    }
}
