//
//  TableViewController.swift
//  weatherApp
//
//  Created by 천승희 on 2023/01/31.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.dailyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.cellId, for: indexPath) as? DailyCell else {
            return UITableViewCell()
        }
        
        let data = MainViewController.dailyData
        
        if indexPath.row == 0 {
            cell.dayLabel.text = "오늘"
        } else {
            cell.dayLabel.text = getDay(date: TimeInterval(data[indexPath.row].dt))
        }
        
        cell.weatherImageView.image = UIImage(named: data[indexPath.row].weather[0].icon)
        cell.minLabel.text = "최저:" + String(Int(data[indexPath.row].temp.min)) + "°"
        cell.maxLabel.text = "최고:" + String(Int(data[indexPath.row].temp.max)) + "°"
        cell.selectionStyle = .none
        
        return cell
    }
    
    func getDay(date: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEE"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        let day = dateFormatter.string(from: date)
        
        return day
    }
}
