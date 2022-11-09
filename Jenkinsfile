pipeline {
    agent any
    stages {
	stage('Lint') {
	    steps {
		echo 'Invoking hadolint...'
		sh 'docker run --rm -i hadolint/hadolint Dockerfile* | tee -a hadolint_lint.txt'
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
