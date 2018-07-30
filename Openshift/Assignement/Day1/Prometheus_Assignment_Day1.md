# Topic Prometheus Installation on Virtual Machine

## Topic to be covered
- Prometheus Installation
- Concepts of Exporters
- Pull based mechanism
- Alerting rules in Prometheus

## What will you learn
1. Concept of infrastructure monitoring and why it is needed.
2. What is prometheus and how it helps us to monitor our infrastructure and services.
3. How to use different kind of exporters for monitoring and how to integrate it with prometheus.
4. How to create job in Prometheus and provide targets for it.
5. How to define alerting rules in prometheus.

## The Assignment
You have to perform this assignment by creating roles for exporter and server.

**Exporters**
- MySQL Exporter
- Node Exporter
- Nginx Exporter
- MongoDB Exporter
- Collectd Exporter
- Jenkins Exporter

**Prometheus**
- Install prometheus server on your vagrant machine or vm.
- Configure another machine and install node exporter on it and monitor it with prometheus.
- Install MySQL or Mongo on that node and monitor MySQL or Mongo with prometheus.
- Install Apache or Nginx on that node and monitor Apache or Nginx with prometheus.
- Install Collectd and Jenkins exporter and monitor it with prometheus.

**Alerting**
- Create alert if node is down for more than 2 min
- Create alert if cpu utilization of node more than 80%
- Create alert if mysql or mongo scrape error is above than 1
- Create alert if mysql connection error or mongo connection error is above than 1
- Create alert if jenkins job is failing more than 1 time.

## Refrence
https://prometheus.io/docs/instrumenting/exporters/
