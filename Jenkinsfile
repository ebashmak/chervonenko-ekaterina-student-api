pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo '=== Stage 1: Retrieving source code from GitHub ==='
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo '=== Stage 2: Compiling Spring Boot application for Ekaterina Chervonenko ==='
                sh './gradlew clean bootJar --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo '=== Stage 3: Executing automated tests ==='
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo '=== Stage 4: Building personalized Docker image ==='
                sh 'docker build -t chervonenko-ekaterina-student-api:v1.0-chervonenko-ekaterina .'
            }
        }

        stage('Verify') {
            steps {
                echo '=== Stage 5: Verifying Docker image existence ==='
                sh 'docker images | grep chervonenko-ekaterina-student-api'
                echo 'Pipeline successfully finished for student Chervonenko Ekaterina!'
            }
        }
    }
}
