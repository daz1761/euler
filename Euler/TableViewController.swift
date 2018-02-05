//
//  TableViewController.swift
//  Euler
//
//  Created by Darryl Griffiths on 30/01/2018.
//  Copyright © 2018 Darryl Griffiths. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private var myModel = model()
    private var fib_array = [Int]()
    private var euler_ans = [Int]()
    private let euler_titles = ["Multiples", "Fibonacci", "Prime"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // multiples
        let multiple_ans = myModel.getMultiples()
        let multiple_sum = multiple_ans.reduce(0, +)  // sum array
        euler_ans.append(multiple_sum)
        
        // fibonacci
        let fib_ans = myModel.fibonacciSequence()
        
        for fib in fib_ans {
            if fib % 2 == 0 {
                self.fib_array.append(fib)
                
            }
        }
        let fib_sum = fib_array.reduce(0, +)  // sum array
        euler_ans.append(fib_sum)
        
        // prime
        if let prime_ans = myModel.prime(num: 600851475143) {
            euler_ans.append(Int(prime_ans))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return euler_titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = String(euler_titles[indexPath.row])
        cell.detailTextLabel?.text = String(euler_ans[indexPath.row])

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
