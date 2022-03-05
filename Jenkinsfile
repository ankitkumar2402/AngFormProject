pipeline {
  agent {
    any { image 'node:latest' }
  }
  stages {
    stage('Install') {
     // steps { sh 'npm install' }
      steps { echo 'installing the npm' }
      
    }

    stage('Test') {
      parallel {
        stage('Static code analysis') {
          // steps { sh 'npm run-script lint' }
          steps { echo 'testing stage running' }
          
        }
        stage('Unit tests') {
           // steps { sh 'npm run-script test' }
          steps { echo 'npm test running' }
          
        }
      }
    }

    stage('Build') {
      //steps { sh 'npm run-script build' }
      steps { echo 'building the application' }
      
    }
  }
}
