//
//  FibonacciNumTableViewController.swift
//  LifeFuelsTest
//
//  Created by Philip Loy on 8/28/15.
//  Copyright (c) 2015 Philip Loy. All rights reserved.
//

import UIKit

class FibonacciNumTableViewController: UITableViewController {

    // Array to hold list of fibonacci numbers that will be precalculated before the table is created.
    var fibonacciNumberArray = [UInt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the first two values (0, 1) to the array.
        fibonacciNumberArray.append(0);
        fibonacciNumberArray.append(1);
        
        // This is where the fibonacci number calculations occur.  With a "for" loop, the code
        // takes the first and second values of the array and adds them together to calculate the
        // fibonacci number, which is then appended to the end of the array.  The "addWithOverflow"
        // function is used to check if the addition operation is successful.  Each loop iteration
        // increments the index until the addition operation fails due to overflow from the two
        // values.  Once we are done, there should be a complete list of fibonacci numbers possible
        // on a 64-bit system.
        var done = false
        for var i = 0; !done; i++ {
            var testEntry = UInt.addWithOverflow(fibonacciNumberArray[i], fibonacciNumberArray[i + 1])
            if testEntry.overflow {
                done = true
            } else {
                fibonacciNumberArray.append(testEntry.0)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }

    // Set number of cells to total number of calculated fibonacci number in array.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibonacciNumberArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {

        // Get cell, casted as a FibonacciNumTableViewCell.
        let cell = self.tableView.dequeueReusableCellWithIdentifier("FibonacciNumTableViewCell", forIndexPath: indexPath) as! FibonacciNumTableViewCell
        
        // Get the row number associated with the cell; this will be the index for the array.
        let rowNumber = UInt(indexPath.row)
        
        // Get the precalculated value from the array.
        let result = fibonacciNumberArray[indexPath.row]

        // Set label of text from cell to include index and fibonacci number.  Make sure to add
        // '1' to index so the range starts at '1'.
        cell.labelFibonacciNumber.text = "N = \(rowNumber + 1); F(N) = \(result)"
    
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
}
