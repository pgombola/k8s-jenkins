pipeline {
  agent any
    
  stages {
    stage("template") {
      steps {
        echo 'templating yaml configs'
      }
    }

    stage("deploy") {
      echo 'deploying yaml configs to k8s'
    }
  }      
}
