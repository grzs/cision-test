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
		echo 'Invoking hadolint'
		sh 'docker run --rm -i hadolint/hadolint < Dockerfile.builder | tee -a hadolint_lint.txt'
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
		sh 'docker build -t ${REPO}:${TAG_BUILDER} -f Dockerfile.builder .'
            }
	}
	stage('Push image - builder') {
	    steps {
		sh 'docker push ${REPO}:${TAG_BUILDER}'
            }
	}
	stage('Build runner') {
	    steps {
		sh 'docker run --name nginx_builder ${REPO}:${TAG_BUILDER}'
		sh 'docker cp nginx_builder:/nginx.tar.gz ./'
		sh 'docker build -t ${REPO}:${TAG_RUNNER} -f Dockerfile.runner .'
            }
	}
	stage('Push image - runner') {
	    steps {
		sh 'docker push ${REPO}:${TAG_RUNNER}'
            }
	}
        // stage('Test') {
        //     steps {
	// 	echo 'Testing with Anchor...'
        //     }
        // }
        stage('Cleanup') {
            steps {
		sh 'docker rm nginx_builder'
		sh 'rm nginx.tar.gz'
            }
        }
    }
}
