//
//  ViewController.swift
//  Try
//
//  Created by Tejasav Khattar on 11/07/19.
//  Copyright © 2019 Tejasav Khattar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let reuseID: String = "mycell"
    
    var arrayofUsers: [User] = []
    var image: Data = Data()
    let tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //createViews()
        
        let user = Users()
        user.getImage(urlString: "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500") { (data) in
            self.image = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        user.getData(urlString: "https://jsonplaceholder.typicode.com/users") { (users) in
            self.arrayofUsers = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
             createList()
    }
    
    func createList(){
       
        view.addSubview(tableView)
        tableView.set(.fillSuperView(view))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: reuseID)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! MyTableViewCell
        
        cell.setData(user: arrayofUsers[indexPath.row],image: image)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayofUsers[indexPath.row].name)
    }
    
    
    func createViews() {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        redView.set(.top(view,50),
                    .sameLeadingTrailing(view,12),
                    .height(200))
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        
        yellowView.set(.below(redView,12),
                       .leading(view,12),
                       .width(30),
                       .height(100))
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        greenView.set(.after(yellowView,12),
                       .below(redView,12),
                       .trailing(view,12),
                       .height(100))
        //same as above
        
//        greenView.set(.after(yellowView,12),
//                      .top(yellowView),
//                      .trailing(view,12),
//                      .height(100))
        
       
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)

        blueView.set(.below(greenView,12),
                       .trailing(view,12),
                       .width(30),
                       .height(100))
        
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        orangeView.set(.below(greenView,12),
                     .before(blueView,12),
                     .leading(view,12),
                     .height(100))
        
        
    }
}

