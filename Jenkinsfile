pipeline {
    agent any
    stages {
	stage('Linter') {
	    steps {
		echo 'Invoking hadolint - builder'
		sh 'docker run --rm -i hadolint/hadolint < Dockerfile.builder'
		echo 'Invoking hadolint - runner'
		sh 'docker run --rm -i hadolint/hadolint < Dockerfile.runner'
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
