// The name of the product. Assumed to be the name of the Git repo. Also used in creating the messages for sending to the Slack channel.
productName = "rschedule-ml-aset-reclist"


config = [
	"develop": [
		"target_environment": "dev",
		"s3Bucket": "rgis-rschedule-ml-lambda-dev",
		"lambda_function": "ml-aset-recommendation-dev"
	],
	"release": [
		"target_environment": "qa",
		"s3Bucket": "rgis-rschedule-ml-lambda-qa",
		"lambda_function": "ml-aset-recommendation-qa"
	],
	"master": [
		"target_environment": "master",
		"s3Bucket": "rgis-rschedule-ml-lambda-prod",
		"lambda_function": "ml-aset-recommendation-prod"
		]
	]


def getBranchParentDir() {
    rawBranch = env.BRANCH_NAME
	echo env.BRANCH_NAME
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



pipeline {
    agent any
    stages {
        stage('Build') {
        	when {
        		anyOf {
        			branch "develop"
                    		branch "release/*"
				branch "master"
        		}
        	}
            steps {
		echo "fck"
                getBranchParentDir()
            }
        }
    }
}
