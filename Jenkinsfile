node {
    def dockerImage = 'node:16-buster-slim'
    def portDockerImage = '-p 3000:3000':

    stage('Build') {
            try {
                docker.image(dockerImage).inside(portDockerImage) {
                    sh 'npm install'
                }
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error "Build failed: ${e.message}"
            }
        }

    stage('Test') {
            try {
                docker.image(dockerImage).inside(portDockerImage) {
                    sh './jenkins/scripts/test.sh'
                }
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error "Tests failed: ${e.message}"
            }
        }
    }
