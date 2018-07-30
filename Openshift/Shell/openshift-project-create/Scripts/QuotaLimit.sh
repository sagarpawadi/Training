#!/bin/bash
function quotaCreation() {
    NAMESPACE=$1
    HARD_CPU=$2
    HARD_MEMORY=$3
    if [ "${NAMESPACE}" != "" ]
    then
        echo "oc process -f ../templates/quota-create.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}"
        oc process -f templates/quota-create.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}
    else
        echo "Provide Valid Input"
    fi
}

function limitsCreation() {
    NAMESPACE=$1
    HARD_CPU=$2
    HARD_MEMORY=$3
    if [ "${NAMESPACE}" != "" ]
    then
        echo "oc process -f ../templates/limits.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU}"
        oc process -f templates/limits.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}
    else
        echo "Provide Valid Input"
    fi
}

function readQoutaLimitsProperties() {
    QUOTA_PROPERTYFILE=$1
    if [ "$1" != "" ]
    then
        NAMESPACE=`sed -n "1 p" ${QUOTA_PROPERTYFILE} | cut -d "=" -f 2`
        HARD_CPU=`sed -n "10 p" ${QUOTA_PROPERTYFILE} | cut -d "=" -f 2`
        HARD_MEMORY=`sed -n "11 p" ${QUOTA_PROPERTYFILE} | cut -d "=" -f 2`
        quotaCreation ${NAMESPACE} ${HARD_CPU} ${HARD_MEMORY}
        limitsCreation ${NAMESPACE} ${HARD_CPU} ${HARD_MEMORY}
    elif [ "$1" = "" ]
    then
        echo "Error:- Need Property file to provide quota and limits"
    fi
}