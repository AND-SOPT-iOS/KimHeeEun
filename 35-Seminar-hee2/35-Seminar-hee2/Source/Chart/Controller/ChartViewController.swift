//
//  ChartViewController.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 10/26/24.
//

import SnapKit
import UIKit
import Then

class ChartViewController: UIViewController {

    private let chartTableView = UITableView()
    private let appList = App.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubview(chartTableView)
    }
    
    private func setStyle() {
        chartTableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier
            )
            $0.rowHeight = 100
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        chartTableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension ChartViewController: UITableViewDelegate{}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chartTableView.dequeueReusableCell(
            withIdentifier: ChartCell.identifier,
            for: indexPath
        ) as? ChartCell else {
            return UITableViewCell()
        }
        cell.configure(app: appList[indexPath.row])
        return cell
    }

}
