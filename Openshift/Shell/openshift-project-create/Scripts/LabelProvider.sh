#!/bin/bash
function labelsProvider() {
    PROJECT_NAME=$1
    APPNAME=$2
    BILLINGID=$3
    LOB=$4
    PROGRAMID=$5
    ENVIRONMENT_TYPE=$6
    ENVIRONMENT_NAME=$7
    if [ $PROJECT_NAME != "" ]
    then
        echo "oc label --overwrite namespace ${PROJECT_NAME} app-name=${APPNAME} billing-dept-id=${BILLINGID} lob=${LOB} program-id=${PROGRAMID} environment-type=${ENVIRONMENT_TYPE} environment-name=${ENVIRONMENT_NAME}"
        oc label --overwrite namespace ${PROJECT_NAME} app-name=${APPNAME} billing-dept-id=${BILLINGID} lob=${LOB} program-id=${PROGRAMID} environment-type=${ENVIRONMENT_TYPE} environment-name=${ENVIRONMENT_NAME}
    else
        echo "Invalid Project"
    fi
}

function readLabelsProperties() {
    PROPERTYFILE=$1
    if [ "$1" != "" ]
    then
        PROJECT_NAME=`sed -n "1 p" ${PROPERTYFILE} | cut -d "=" -f 2`
        APPNAME=`sed -n "4 p" ${PROPERTYFILE} | cut -d "=" -f 2`
        BILLINGID=`sed -n "5 p" ${PROPERTYFILE} | cut -d "=" -f 2`
        LOB=`sed -n "6 p" ${PROPERTYFILE} | cut -d "=" -f 2`
        PROGRAMID=`sed -n "7 p" $1 | cut -d "=" -f 2`
        ENVIRONMENT_TYPE=`sed -n "8 p" $1 | cut -d "=" -f 2`
        ENVIRONMENT_NAME=`sed -n "9 p" $1 | cut -d "=" -f 2`
        labelsProvider ${PROJECT_NAME} ${APPNAME} ${BILLINGID} ${LOB} ${PROGRAMID} ${ENVIRONMENT_TYPE} ${ENVIRONMENT_NAME}
    elif [ "$1" = "" ]
    then
        echo "Error:- Need Property file to provide labels"
    fi
}