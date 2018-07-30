## The Assignment

1. Configure sftp server with user name - your name, only that user can access sftp.
2. create following directories on sftp 
- files
- success
- fail
3. Upload files to sftp server in files directory.
rachit_10.csv
anc_11.csv
abc_12.csv

4. Set incron on sftp server.

incron will execute a shel script that will perform below task.

validate files uploaded in sftp in files directory
validation - 
- file name should match the number of records  in the files.
For example - rachit_10.csv will have 10 records of string rachit.
- If file validation returns true, copy that file in success folder else in fail folder.

5. List all the sccuess and failed files using ansible. 

