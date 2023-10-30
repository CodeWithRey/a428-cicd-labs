node {
    def dockerImage = 'node:16-buster-slim'
    def portDockerImage = "-p 3000:3000"

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
    stage('Deploy') {
         try {
                docker.image(dockerImage).inside(portDockerImage) {
                        sh './jenkins/scripts/deliver.sh'
                        input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)'
                        sh './jenkins/scripts/kill.sh'
                        sleep(time:1, unit:"SECONDS")
                }
            } catch (Exception e) {
                currentBuild.result = 'FAILURE'
                error "Deploy failed: ${e.message}"
            }
    }
}
