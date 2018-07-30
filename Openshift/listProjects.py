from openshift import client as oclient
from kubernetes import client, config
config.load_kube_config()
oapi = oclient.OapiApi()
api=client.CoreV1Api()

projects = oapi.list_project().items
print("Below projects exists in our cluster")
for project in projects:
    print(project)
