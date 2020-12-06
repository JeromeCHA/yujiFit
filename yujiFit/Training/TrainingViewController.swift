//
//  TrainingViewController.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit
import Combine

class TrainingViewController: UITableViewController {

    var presenter: TrainingPresenter?
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindData()
        setupTableView()
        presenter?.updateList()
    }

    private func setup() {
        title = "Training"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTrainingExercice))
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "TrainingCell", bundle: nil), forCellReuseIdentifier: "TrainingCell")
        tableView.estimatedRowHeight = 45
    }

    private func bindData() {
        presenter?.$list_data
            .receive(on: DispatchQueue.main)
            .sink { [weak self] list in
                self?.tableView.reloadData()
            }.store(in: &cancellables)
    }

    @objc private func addTrainingExercice() {
        let alert = UIAlertController(title: "Add a data to track", message: nil, preferredStyle: .actionSheet)
        let addTrainingAction = UIAlertAction(title: "Add a training", style: .default) { [weak self] _ in
            self?.presenter?.addTraining()
        }
        let addValueAction = UIAlertAction(title: "Add a value", style: .default) { [weak self] _ in
            self?.presenter?.addSingleValue()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addTrainingAction)
        alert.addAction(addValueAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.list_data.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingCell") as? TrainingCell else {
            return UITableViewCell()
        }
        if let trainig = presenter?.list_data[indexPath.row] as? Training {
            cell.setData(title: trainig.name)
        } else if let singleValue = presenter?.list_data[indexPath.row] as? SingleValue {
            cell.setData(title: singleValue.name)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView(frame: CGRect.zero)
    }
}
