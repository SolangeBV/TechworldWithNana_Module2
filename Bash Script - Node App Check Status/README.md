# EXERCISE 7, 8, 9: Bash Script - Start Node App Check Status, Log Directory, Service User

- __vim start_node_app.sh__: create file and open it in Vim editor
- Press _i_ to edit the file
- Insert code in the file (see check_processes.sh in this folder)
- Press _esc_, then type _:wq_ to exit the Vim editor and save the changes
- __chmod +x start_node_app.sh__: to make the script executable
- __./start_node_app.sh__: to run the script
- __NB__: note that the ampersand _&_ is used to run a command in the background, allowing it to execute indipendently of the current terminal session
- __sudo ./start_node_app.sh /home/myapp/log

__NB__: for some reason I cannot retrieve/create the app.log file, hence my logs look a little different from what was expected (but I still check for the port and if the application is running)
