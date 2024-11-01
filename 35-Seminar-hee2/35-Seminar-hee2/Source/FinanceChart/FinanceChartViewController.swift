//
//  FinanceChartViewController.swift
//  35-Seminar-hee2
//
//  Created by 김희은 on 11/1/24.
//

import SnapKit
import UIKit
import Then

class FinanceChartViewController: UIViewController {
    
    private let financeChartTableView = UITableView()
    private let sectionList = FinanceSection.sectionData
    private let appList = App.mockData
    private let headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubview(financeChartTableView)
    }
    private func setStyle() {
        financeChartTableView.do {
            $0.register(
                ChartCell.self,
                forCellReuseIdentifier: ChartCell.identifier
            )
            $0.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
            $0.rowHeight = 100
            $0.delegate = self
            $0.dataSource = self
        }
    }
    private func setLayout() {
        financeChartTableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension FinanceChartViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView else {
            return nil
        }
        headerView.configure(section: sectionList[section])
        //headerView.backgroundColor = .cyan
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionData = sectionList[section]
        let headerHeight: CGFloat = sectionData.title.isEmpty ? 0 :
        sectionData.subtitle.isEmpty ? 60 : 75
        return headerHeight
    }
    
    // MARK: - Rows of Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = financeChartTableView.dequeueReusableCell(
            withIdentifier: ChartCell.identifier,
            for: indexPath
        ) as? ChartCell else {
            return UITableViewCell()
        }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
}
