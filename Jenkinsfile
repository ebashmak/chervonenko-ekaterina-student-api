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
                echo '=== Stage 2: Compiling Spring Boot application (Fixed) ==='
                sh './gradlew clean bootJar --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo '=== Stage 3: Executing automated tests ==='
                sh './gradlew test --no-daemon'
                echo 'Pipeline successfully fixed and finished!'
            }
        }
    }
}
