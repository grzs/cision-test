pipeline {
    agent any
    stages {
	stage('Lint') {
	    agent {
		docker {
		    image 'hadolint/hadolint:latest-debian'
		}
	    }
	    steps {
		echo 'Invoking hadolint...'
		sh 'hadolint Dockerfile* | tee -a hadolint_lint.txt'
	    }
	    post {
		always {
		    archiveArtifacts 'hadolint_lint.txt'
		}
	    }
	}
	stage('Build') {
	    steps {
		echo 'Building...'
		sh 'ls -la'
            }
	}
        stage('Test') {
            steps {
		echo 'Testing...'
		sh 'ls -la'
            }
        }
        stage('Deploy') {
            steps {
		echo 'Deploying to Kind cluster...'
            }
        }
    }
}
