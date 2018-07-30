"""Module Getting Routes Information in Openshift"""
import argparse
from enum import Enum
from openshift import client, config
import openshift.client
from kubernetes.client.rest import ApiException
from pprint import pprint

config.load_kube_config()
oapi = client.OapiApi()

podInfoDict = {}

name = "prometheus"
api_instance = openshift.client.RouteOpenshiftIoV1Api(openshift.client.ApiClient())

api_response = api_instance.list_namespaced_route(name).items
#print(api_response)
for project in api_response:
    podInfoDict[project.spec.to.name] = project.spec.host

print(podInfoDict)
