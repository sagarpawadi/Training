#!/bin/bash
function usage() {
    echo "Usage:- Provide properies file for example ====== project.properties" 
    echo "Usage:- Execute script like this           ====== ./ProjectCreation.sh Project.properties"
}

function projectCreation() {
    PROJECT_NAME=$1
    PROJECT_DISPLAY_NAME=$2
    PROJECT_DESCRIPTION=$3
    if [ "$PROJECT_NAME" != "" ]
    then
        echo "oc new-project ${PROJECT_NAME} --display-name=${PROJECT_DISPLAY_NAME} --description=${PROJECT_DESCRIPTION}"
        oc new-project ${PROJECT_NAME} --display-name=${PROJECT_DISPLAY_NAME} --description=${PROJECT_DESCRIPTION}
    else
        echo "Provide Valid Project"
    fi
}

function readProjectProperties() {
    PROJECT_PROPERTYFILE=$1
    if [ "$1" != "" ]
    then
        PROJECT_NAME=`sed -n "1 p" ${PROJECT_PROPERTYFILE} | cut -d "=" -f 2`
        PROJECT_DISPLAY_NAME=`sed -n "2 p" ${PROJECT_PROPERTYFILE} | cut -d "=" -f 2`
        PROJECT_DESCRIPTION=`sed -n "3 p" ${PROJECT_PROPERTYFILE} | cut -d "=" -f 2`
        projectCreation ${PROJECT_NAME} ${PROJECT_DISPLAY_NAME} ${PROJECT_DESCRIPTION}
    elif [ "$1" = "" ]
    then
        usage
        echo "Error:- Need Property file to provide project"
    fi
}