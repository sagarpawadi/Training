# pylint: disable = invalid-name, redefined-outer-name, line-too-long

""" I am a utiltiy to create labels CSV files from a cluster and also viceversa.
Pre-requisite: You have to be logged in to the cluster also the token should be updated in ~/.kube/config file
How-To Use:
Generate labels CSV file from a cluster:
python Cluster CSV2labels <cluster-context-name>
Note: cluster-context-name should be matching to entry in .kube/config
Generate labels in the cluster from CSV file:
python Cluster labels2CSV <cluster-context-name>
Note: cluster-context-name should be matching to a CSV available in current working directory.
"""

import argparse
import csv
import subprocess
from openshift import client as oclient
from kubernetes import config

fieldnames = ["project_name", "project-display-name", "billing-dept-id", "lob", \
                 "app-name", "program-id", "owner-email", \
                 "environment-type", "environment-name"]

def initiateAPI(cluster):
    """ Function to make an oapi Object. """
    config.load_kube_config(context=cluster)
    oapi = oclient.OapiApi()
    return oapi

def generateCsvFile(cluster, oapi):
    """ Function to generate the CSV file. """
    clusterCsvFile = cluster + "ProjectLabels.csv"
    with open(clusterCsvFile, 'w') as csvfile:
        csvWriter = csv.DictWriter(csvfile, fieldnames=fieldnames)
        csvWriter.writeheader()
        projects = oapi.list_project().items

        for project in projects:
            if project.metadata.labels is not None:
                labelsDict = project.metadata.labels
                labelsDict['project_name'] = project.metadata.name
                csvWriter.writerow(labelsDict)
            else:
                print("Labels for project " + project.metadata.name + " doesn't exit")

def createProjectLabel(**labelMetadataDict):
    """ Function to create the labels for a project. """
    print(labelMetadataDict)
    for fieldname in fieldnames[1:]:
        if labelMetadataDict[fieldname] is not None:
            labelCreationCommand = "oc label --overwrite namespace" + " " + labelMetadataDict[fieldnames[0]] + " " + fieldname + "=" + labelMetadataDict[fieldname]
            print(labelCreationCommand)
            #process_object = subprocess.Popen(labelCreationCommand, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            #(stdout) = process_object.communicate()
            #print(stdout)

def createProjectsLabels(cluster):
    """ Function to create the labels for a projects in a cluster. """
    clusterCsvFile = cluster + "ProjectLabels.csv"
    #Add condition to validate existence of file
    with open(clusterCsvFile) as csvfile:
        reader = csv.DictReader(csvfile)
        for labelRow in reader:
            createProjectLabel(**labelRow)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("option", help="Option to Generate label's CSV or parse it")
    parser.add_argument("cluster", help="Cluster context defined in your kube.config")
    args = parser.parse_args()
    oapi = initiateAPI(args.cluster)
    if args.option == 'labels2CSV':
        generateCsvFile(args.cluster, oapi)
    elif args.option == 'CSV2labels':
        createProjectsLabels(args.cluster)
    else:
        print("Please provide first option as labels2CSV|CSV2labels")
