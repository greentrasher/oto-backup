## @author : ben supanga(2013)
## backup directory - automated backup directory processing
## 

Directory Structure
-------------------
  @ - oto_backup
	- scheme - this is where the different backup schema
		  you want to implement for the said folder. 
  * Root Directory and Sub Directories 
    - /backup/
	- README.txt	
	- /grails
	- /logs
	- /oracle	
	- /shell
	- /android
	- /installer
	- /misc
	- /perl
	- /videos
	- /batch
	- /ios
	- /mp3
	- /php
	- /documents
	- /java
	- /mysql
	    - .run   
		* run application - this will be called to 
		  run the backup, according to the specified 
		  backup process inside the folder.
	    - .list  
		* list of files, directory or database to be backup
		* for mysql this should be database name
			 
	- /images   



