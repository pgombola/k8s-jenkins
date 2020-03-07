pipeline {
  agent any
  
  node {
    stage('Apply kubernetes files') {
      withKubeConfig([credentialsId: 'user1', serverUrl: 'https://192.168.99.100:8443']) {
        sh 'kubectl get nodes'
      }
    }
  }

  stages {
    stage("template") {
      steps {
        echo 'templating yaml configs'
      }
    }

    stage("deploy") {
      steps {
        echo 'deploying yaml configs to k8s'
      }
    }
  }      
}
