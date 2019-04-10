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
}

def getLambdaFunction() {
    lambdaFunction = getConfigValue("lambda_function")
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
