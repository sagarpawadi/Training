// The name of the product. Assumed to be the name of the Git repo. Also used in creating the messages for sending to the Slack channel.
productName = "rschedule-ml-aset-reclist"

// The root URL of the Git repo. Combined with the productName above to create the entire Git repo URL.
gitRootUrl = "ssh://bitbucket.org/rgisllc"

config = [
    "develop": [
        "target_environment": "dev",
        "s3Bucket": "lambda-dev",
        "lambda_function": "recommendation-dev"
    ],
    "release": [
        "target_environment": "qa",
        "s3Bucket": "lambda-qa",
        "lambda_function": "recommendation-qa"
    ],
  "master": [
    "target_environment": "master",
        "s3Bucket": "lambda-prod",
        "lambda_function": "recommendation-prod"
  ]
]

def getBranchParentDir() {
    rawBranch = env.BRANCH_NAME

    startIndex = rawBranch.indexOf('/')

    if (startIndex == -1) {
        return rawBranch
    }

    return rawBranch.substring(0, startIndex)
}

def getConfigValue(name) {
	configHash = config[getBranchParentDir()]

	if (configHash == null) {
		return ""
	}

	return configHash[name]
}

def getBuildTargetEnvironment() {
	environment = getConfigValue("target_environment")

	if (environment == null || environment == "") {
		return "dev"
	}

	return environment
}

def gets3BucketName() {
	s3Bucket = getConfigValue("s3Bucket")
    return s3Bucket
}

def getLambdaFunction() {
	lambdaFunction = getConfigValue("lambda_function")
    return lambdaFunction
}

def dockerCleanup() {
    sh 'docker rmi -f rschedulereclist:latest'
}


pipeline {
    agent any
    stages {
        stage('Publish') {
        	when {
        		anyOf {
        			branch "develop"
                    branch "release/*"
                    branch "master"
        		}
        	}
            steps {
                sh "echo ${getLambdaFunction()}"
            }
        }
    }
}
