pipeline {
    agent any

    tools {
        jdk 'JDK17'
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/saivivek-89/spring-petclinic.git'
            }
        }

        stage('Verify Environment') {
            steps {
                sh 'echo "JAVA_HOME=$JAVA_HOME"'
                sh 'java -version'
                sh 'git --version'
                sh 'docker --version'
                sh 'trivy --version'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x mvnw'
                sh './mvnw clean package'
            }
        }

    }

    post {
    success {
        echo 'Build completed successfully!'
    }

    failure {
        echo 'Build failed.'
    }

    // always {
    //     cleanWs()
    // }
    }
}
