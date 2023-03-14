#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
	AWS_ACCESS_KEY_ID = credentials(AWS_ACCESS_KEY_ID)
	AWS_SECRET_ACESS_KEY = credentials(AWS_SECRET_ACCESS_KEY)
	AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create Backends") {
            steps {
                script {
                    dir("backend") {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
	stage("Create Cluster With Prometheus and Grafana") {
	    steps {
		script {
		    dir("provision") {
			sh "terraform init"
			sh "terraform apply -auto-approve"
		    }
		}	
	    }
	}
	stage("Deploy App") {
	    steps {
		script {
		    dir("deploy") {
			sh "aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)"
		    }
		}
	    {
	}
    }
}
