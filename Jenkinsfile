pipeline {
    agent any
    stages {
	stage('Lint') {
	    steps {
		echo 'Invoking hadolint - builder'
		sh 'docker run --rm -i hadolint/hadolint < Dockerfile.builder | tee -a hadolint_lint.txt'
		echo 'Invoking hadolint - runner'
		sh 'docker run --rm -i hadolint/hadolint < Dockerfile.runner | tee -a hadolint_lint.txt'
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
