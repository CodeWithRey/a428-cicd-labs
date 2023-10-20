node {
    def dockerImage = 'node:16-buster-slim'

    triggers {
        pollSCM('*/2 * * * *')
    }

    stage('Build') {
        steps {
            echo 'Building the project...'
            try {
                docker.image(dockerImage).inside("-p 3000:3000") {
                    sh 'npm install'
                }
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error "Build failed: ${e.message}"
            }
        }
    }

    stage('Test') {
        steps {
            echo 'Running tests...'
            try {
                docker.image(dockerImage).inside("-p 3000:3000") {
                    sh './jenkins/scripts/test.sh'
                }
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error "Tests failed: ${e.message}"
            }
        }
    }
}
