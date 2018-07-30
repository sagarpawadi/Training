#!/bin/bash

source OpenshiftFunction.sh
source WebFunction.sh

#### Configuration for Namespace Check ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Namepaces Status"
endRow

namespaceExists default
namespaceExists kube-system
namespaceExists logging
namespaceExists management-infra
namespaceExists openshift
namespaceExists openshift-infra
namespaceExists xpaas-jenkins-slaves
namespaceExists xpaas-log-shipper
namespaceExists xpaas-prometheus
endHtml
cp index.html namespace_status.html

#### Configuration for ImageStream Check ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Image Streams Count"
endRow

imageStreamsCount openshift
imageStreamsCount xpaas-log-shipper
imageStreamsCount xpaas-prometheus
endHtml
cp index.html image_stream_status.html

#### Configuration for Pod status ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Pod Name"
generateTextCell "Pod Status"
endRow

podStatusCheck default docker-registry
podStatusCheck default router
podStatusCheck default registry-console
podStatusCheck logging fluentd
podStatusCheck logging logging-es
podStatusCheck logging curator
podStatusCheck logging kibana
podStatusCheck openshift-infra hawkular-cassandra
podStatusCheck openshift-infra heapster
podStatusCheck xpaas-log-shipper log-shipper
podStatusCheck xpaas-prometheus grafana
podStatusCheck xpaas-prometheus prometheus
podStatusCheck xpaas-prometheus elasticsearch
podStatusCheck xpaas-prometheus kube-state-metrics
podStatusCheck xpaas-prometheus alertmanager
endHtml
cp index.html pod_status.html

#### Configuration for Service Status ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Service Name"
generateTextCell "Service Status"
endRow

serviceStatusCheck default docker-registry
serviceStatusCheck default registry-console
serviceStatusCheck default router
serviceStatusCheck default kubernetes
serviceStatusCheck logging logging-kibana
serviceStatusCheck openshift-infra hawkular-cassandra
serviceStatusCheck openshift-infra hawkular-cassandra-nodes
serviceStatusCheck openshift-infra hawkular-metrics
serviceStatusCheck openshift-infra heapster
serviceStatusCheck xpaas-prometheus prometheus
serviceStatusCheck xpaas-prometheus grafana
serviceStatusCheck xpaas-prometheus alertmanager
endHtml
cp index.html service_status.html

#### Configuration for Route Status ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Route Name"
generateTextCell "Route Status"
endRow

routeStatusCheck default docker-registry
routeStatusCheck default registry-console
routeStatusCheck logging logging-kibana
routeStatusCheck openshift-infra hawkular-metrics
routeStatusCheck xpaas-prometheus prometheus
routeStatusCheck xpaas-prometheus grafana
routeStatusCheck xpaas-prometheus alertmanager-auth
endHtml
cp index.html route_status.html

#### Configuration for Validation of Route ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "Route Name"
generateTextCell "Route Status Code"
endRow

statusCodeCheck_https default docker-registry
statusCodeCheck_https default registry-console
statusCodeCheck_https logging hawkular-metrics
statusCodeCheck_https xpaas-prometheus alertmanager-auth
statusCodeCheck xpaas-prometheus prometheus
statusCodeCheck xpaas-prometheus grafana
statusCodeCheck logging logging-kibana
endHtml
cp index.html route_status_validation.html

#### Configuration for ConfigMap Status Check ####
startHtml

startRow
generateTextCell "Namespace"
generateTextCell "ConfigMap Name"
generateTextCell "Status"
endRow

configmapStatusCheck xpaas-prometheus prometheus-config
configmapStatusCheck xpaas-prometheus alertmanager
configmapStatusCheck logging logging-curator
configmapStatusCheck logging logging-elasticsearch
configmapStatusCheck logging logging-fluentd
endHtml
cp index.html configmap_status.html

#### Configuration for Fluentd process on Nodes ####

startHtml

startRow
generateTextCell "Node Name"
generateTextCell "Fluend Status"
endRow
nodes=`oc get nodes | grep localhost | awk '{print $1}'`
for node in $nodes
do
  nodeFluentdStatusCheck $node
done
endHtml
cp index.html fluentd_status.html

#### Configuration for Checking Project has Quota or not ####

startHtml

startRow
generateTextCell "Project Name"
generateTextCell "Quota Status"
endRow

projects=`oc get projects | awk 'NR>1 {print $1}'`
for project in $projects
do
  quotaStatusCheck $project
done
endHtml
cp index.html quota_status.html

#### Configuration for Checking Project has Limits or not ####
startHtml

startRow
generateTextCell "Project Name"
generateTextCell "Limit Status"
endRow

projects=`oc get projects | awk 'NR>1 {print $1}'`
for project in $projects
do
  quotaStatusCheck $project
done
endHtml
cp index.html limit_status.html