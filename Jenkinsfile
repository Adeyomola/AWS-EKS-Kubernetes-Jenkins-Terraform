#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
	ANSIBLE_VAULT_PASSWORD_FILE = credentials('ANSIBLE_VAULT_PASSWORD_FILE')
    }
    stages {
        stage("Create Cluster With Prometheus and Grafana") {
            steps {
                script {
                    dir("provision") {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
             }
            options {
                timeout(time: 20, unit: 'MINUTES')
            }
        }
        stage("Deploy App") {
            steps {
                script {
                    dir("deploy") {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
    }
}
