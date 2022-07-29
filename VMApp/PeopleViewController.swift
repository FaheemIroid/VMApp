//
//  PeopleViewController.swift
//  VMApp
//
//  Created by Faheem Hussain on 29/07/22.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var tvList: UITableView!
    
    var viewModel = VCViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
    }
    func initialSetup(){
        Helper.StatusBarColor(view: self.view)

        self.tvList.register(UINib(nibName: "TblListCell", bundle: nil), forCellReuseIdentifier: "TblListCell")
        self.modelDataChangeSetup()
        self.peopleAPI()
       
    }
    

}
extension PeopleViewController{
    //MARK: - People  API Calls
    func peopleAPI() {
        if Helper.checkConnectivity() {
            viewModel.peopleList( )
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    func modelDataChangeSetup(){
        viewModel.itemsDidChange = { [weak self] modelData in
            if ((modelData as? [peopleModel]) != nil){
                DispatchQueue.main.async {
                    self?.tvList.reloadData()
                }
            }
        }
    }
}
//MARK: - Table DataSource
extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.peopleData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TblListCell", for: indexPath) as! TblListCell
            cell.selectionStyle = .none
            cell.setupUI()
            cell.peopleData = viewModel.peopleData?[indexPath.row]
            cell.setupData()
        return cell
    }
}
//MARK: - Table Delegate
extension PeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

