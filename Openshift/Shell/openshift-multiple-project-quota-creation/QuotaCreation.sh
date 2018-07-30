#!/bin/bash
function quotaCreation() {
    NAMESPACE=$1
    HARD_CPU=$2
    HARD_MEMORY=$3
    if [ "${NAMESPACE}" != "" ]
    then
        echo "oc process -f ../templates/quota-create.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}"
        # oc process -f templates/quota-create.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}
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
        # oc process -f templates/limits.yml -p NAMESPACE=${NAMESPACE} -p HARD_MEMORY=${HARD_MEMORY} -p HARD_CPU=${HARD_CPU} | oc apply -f - -n ${NAMESPACE}
    else
        echo "Provide Valid Input"
    fi
}

while read -r line
do
    #echo "Processing line - $line"
    NAMESPACE=`echo $line | cut -d " " -f 1`
    HARD_CPU=`echo $line | cut -d " " -f 2`
    HARD_MEMORY=`echo $line | cut -d " " -f 3`
    quotaCreation ${NAMESPACE} ${HARD_CPU} ${HARD_MEMORY}
    limitsCreation ${NAMESPACE} ${HARD_CPU} ${HARD_MEMORY}
done < "Quota.properties"