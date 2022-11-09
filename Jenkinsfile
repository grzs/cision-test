pipeline {
    agent any
    environment {
	REPO = 'grzs/nginx-cision'
	TAG_BUILDER = 'builder'
	TAG_RUNNER = 'runner-archlinux'
    }
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
	stage('Build builder') {
	    steps {
		echo 'Building nginx builder...'
		sh 'docker build -t ${env.REPO}:${TAG_BUILDER} -f Dockerfile.builder .'
            }
	}
	stage('Push image - builder') {
	    steps {
		sh 'docker push ${env.REPO}:${TAG_BUILDER}'
            }
	}
        // stage('Test') {
        //     steps {
	// 	echo 'Testing...'
	// 	sh 'ls -la'
        //     }
        // }
        stage('Deploy') {
            steps {
		echo 'Deploying to Kind cluster...'
            }
        }
    }
}
