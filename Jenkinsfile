pipeline {
  agent {
    any { image 'node:latest' }
  }
  stages {
    stage('Install') {
     // steps { sh 'npm install' }
      echo 'installing the npm'
    }

    stage('Test') {
      parallel {
        stage('Static code analysis') {
          // steps { sh 'npm run-script lint' }
          echo 'testing stage running'
        }
        stage('Unit tests') {
           // steps { sh 'npm run-script test' }
          echo 'npm test running'
        }
      }
    }

    stage('Build') {
      //steps { sh 'npm run-script build' }
      echo 'building the application'
    }
  }
}
