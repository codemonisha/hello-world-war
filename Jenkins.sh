pipeline {
    agent any 
    
        stages {
        stage('checkout') {
            steps {
                sh 'mvn package'
            }
        }
      }
