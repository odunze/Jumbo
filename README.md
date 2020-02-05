# Jumbo

My submission for the Jumbo Privacy code challenge.

Instructions:
- Run in Simulator.
- Click "Add New" to start an operation.
- Keep clicking to add more operations.

Design Patterns / Architecture:
- MVVM

Strategy: 

- Created a HTML file containing the Javascript link.
- Loaded the HTML with a webview.
- Evaluated the Javascript with the webview
- Captured the callback message and mapped it to the operation struct.
- Displayed the operations using a table view.
- Updated the operation status using a progress view.

Screenshot:
![Screenshot](https://github.com/odunze/Jumbo/blob/master/jumboOperations.jpg)
