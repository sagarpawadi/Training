# Openshift Project Creation
This is a utility for creating project, quota, limits and roles in Openshift Project.
This utility also provide the functionality of providing labels on namespaces(project).

## Overview
In this utility you have:-
- [Scripts](https://github.com/ot-training/Openshift/tree/master/Shell/openshift-project-create/Scripts) :- In the Script directory you will have the all scripts for project, quota, limits and role creation.
- [templates](https://github.com/ot-training/Openshift/tree/master/Shell/openshift-project-create/templates) :- In the templates directory you will have the openshift template for quota and limits creation
- [PropertyFile](https://github.com/ot-training/Openshift/blob/master/Shell/openshift-project-create/Project.properties) :- In the property file you will have the properties of project, quota, limits and role and their values as well.
- [ProjectCreation.sh](https://github.com/ot-training/Openshift/blob/master/Shell/openshift-project-create/ProjectCreation.sh) :- This is the main shell Script file for calling the other scripts and templates.

## Requirments
These are the requirments of this Script
1. **[templates](https://github.com/ot-training/Openshift/tree/master/Shell/openshift-project-create/templates)** directory must be present in the working folder.
2. **[Scripts](https://github.com/ot-training/Openshift/tree/master/Shell/openshift-project-create/Scripts)** also must be present in the directory 
3. You should have the correct value in **[Property File](https://github.com/ot-training/Openshift/blob/master/Shell/openshift-project-create/Project.properties)**.

## Usage
For Executing this script you should provide right values in [PropertyFile](https://github.com/ot-training/Openshift/blob/master/Shell/openshift-project-create/Project.properties). After this you will execute the main script [ProjectCreation.sh](https://github.com/ot-training/Openshift/blob/master/Shell/openshift-project-create/ProjectCreation.sh) like this :-

```
./ProjectCreation.sh Project.properties
```

You can also use this script indvidually for example:- if you just want to create an empty project you can use this like this:-
```
EmptyProject.sh Project.properties
```
It will create a single project for you and just like this you can use other utility also

If you will miss the propertyfile the script  shows message like this
```
Usage:- Provide properies file for example ====== project.properties
Usage:- Execute script like this           ====== ./ProjectCreation.sh Project.properties
Error:- Need Property file to provide project
Error:- Need Property file to provide labels
Error:- Need Property file to provide quota and limits
Error:- Need Property file to provide Roles
```
