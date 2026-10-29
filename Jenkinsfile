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
                echo '=== Stage 2: Intentional error injection for Task 4.3 ==='
                sh './gradlew nonExistentCommandToFailTheBuild'
            }
        }

        stage('Test') {
            steps {
                echo '=== Stage 3: Executing automated tests ==='
                sh './gradlew test --no-daemon'
            }
        }
    }
}
