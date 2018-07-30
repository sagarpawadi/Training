#!/bin/bash
function namespaceExists() {
  NAMESPACE=$1
  startRow
  generateTextCell ${NAMESPACE}
  oc describe project ${NAMESPACE} > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    generateSuccessCell ""
  else
    generateErrorCell
  fi
  endRow
}

function imageStreamsCount() {
  NAMESPACE=$1
  startRow
  generateTextCell ${NAMESPACE}
  oc project ${NAMESPACE}
  count=`oc get is | tail -n +2 | wc -l`
  if [ $count -gt 0 ]
  then
    generateSuccessCell $count
  else
    generateErrorCell
  fi
  endRow
}

function podStatusCheck() {
  NAMESPACE=$1
  POD=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${POD}
  pod_status=`oc get pods -n ${NAMESPACE} | grep ${POD} | awk '{print $3}'`
  if [ "$pod_status" == "" ]
  then
    generateErrorCell
  elif [ "$pod_status" == "$pod_status" ]
  then
    generateSuccessCell ${pod_status}
  fi
  endRow
}

function serviceStatusCheck() {
  NAMESPACE=$1
  SERVICE=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${SERVICE}
  oc describe service ${SERVICE} -n ${NAMESPACE} > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    generateSuccessCell
  else
    generateErrorCell
  fi
  endRow
}

function routeStatusCheck() {
  NAMESPACE=$1
  ROUTE=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${ROUTE}
  oc describe route ${ROUTE} -n ${NAMESPACE} > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    generateSuccessCell
  else
    generateErrorCell
  fi
  endRow
}

function statusCodeCheck() {
  NAMESPACE=$1
  ROUTE=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${ROUTE}
  route_url=`oc get routes -n ${NAMESPACE} | grep "${ROUTE}" | awk '$1=="'${ROUTE}'" {print $2}'`
  status_code=`curl -o -I -s -w "%{http_code}\n" http://$route_url`
  if [ "$status_code" == "200" ]
  then
    generateSuccessCell
  elif [ "$status_code" == "302" ]
  then
    generateSuccessCell
  else
    generateErrorCell
  fi
}

function  statusCodeCheck_https() {
  NAMESPACE=$1
  ROUTE=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${ROUTE}
  route_url=`oc get routes -n ${NAMESPACE} | grep "${ROUTE}" | awk '$1=="'${ROUTE}'" {print $2}'`
  status_code=`curl -s -o -I  -w  "%{http_code}\n" --head  --request GET https://$route_url`
  if [ "$status_code" == "$status_code" ]
  then
    generateSuccessCell
  elif [ "$status_code" == "000" ]
  then
    generateSuccessCell
  else
    generateErrorCell
  fi
  endRow
}

function configmapStatusCheck() {
  NAMESPACE=$1
  CONFIGMAP=$2
  startRow
  generateTextCell ${NAMESPACE}
  generateTextCell ${CONFIGMAP}
  oc describe configmap ${CONFIGMAP} -n ${NAMESPACE} > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    generateSuccessCell
  else
    generateErrorCell
  fi
  endRow
}

function nodeFluentdStatusCheck() {
NODE=$1
startRow
generateTextCell ${NODE}
node_status=`oc describe node ${NODE} | grep logging-infra-fluentd | awk '{print $1}'`
if [ "$node_status" == "" ]
then
  generateErrorCell
elif [ "$node_status" == "$node_status" ]
then
  generateSuccessCell
fi
endRow
}

function quotaStatusCheck() {
NAMESPACE=$1
startRow
generateTextCell ${NAMESPACE}
quota_status=`oc describe quota -n ${NAMESPACE}`
if [ "$quota_status" == "" ]
then
  generateErrorCell
elif [ "$quota_status" == "$quota_status" ]
then
  generateSuccessCell
fi
endRow
}

function limitStatusCheck() {
  NAMESPACE=$1
  startRow
  generateTextCell ${NAMESPACE}
  limit_status=`oc describe limits -n ${NAMESPACE}`
  if [ "$limit_status" == "" ]
  then
    generateErrorCell
  elif [ "$limit_status" == "$limit_status" ]
  then
    generateSuccessCell
  fi
  endRow
}