#!/bin/bash
function addRoleToUser() {
    PROJECT_NAME=$1
    USERID=$2
    ROLE=$3
    echo "oc adm policy add-role-to-user ${ROLE} ${USERID} -n ${PROJECT_NAME}"
    oc adm policy add-role-to-user ${ROLE} ${USERID} -n ${PROJECT_NAME}
}

function addRoleToGroup  {
    PROJECT_NAME=$1
    GROUPID=$2
    ROLE=$3
    echo "oc adm policy add-role-to-user ${ROLE} ${USERID} -n ${PROJECT_NAME}"
    oc adm policy add-role-to-group ${ROLE} ${GROUPID} -n ${PROJECT_NAME}
}

function readRoleProperties() {
    ROLE_PROPERTY=$1
    if [ "$1" != "" ]
    then
        PROJECT_NAME=`sed -n "1 p" ${ROLE_PROPERTY} | cut -d "=" -f 2`
        USERID=`sed -n "12 p" ${ROLE_PROPERTY} | cut -d "=" -f 2`
        GROUPID=`sed -n "13 p" ${ROLE_PROPERTY} | cut -d "=" -f 2`
        ROLE=`sed -n "14 p" ${ROLE_PROPERTY} | cut -d "=" -f 2`
        addRoleToUser ${PROJECT_NAME} ${USERID} ${ROLE}
        addRoleToGroup ${PROJECT_NAME} ${GROUPID} ${ROLE}
    elif [ "$1" = "" ]
    then
        echo "Error:- Need Property file to provide Roles"
    fi
}