pipeline {
  agent { label 'terraform-home'}
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('Clean workspace-1...') {
      steps {
        cleanWs()
      }
    }
    stage('Checkout scm...') {
      steps {
        checkout scm
      }
    }

    stage('terraform plan...') {
      when{
        branch "dev"
      }
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform plan'
        }
        
      }
    }

    stage('terraform apply...') {
      when{
        branch 'main'
      }
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform apply --auto-approve'
        }
        
      }
    }
  }
  /* post {
    always {
      cleanWs()
    }
  } */
  post {
    always {
       mail to: 'jrivasalcon@gmail.com',
          subject: "Status of pipeline: ${currentBuild.fullDisplayName}",
          body: "${env.BUILD_URL} has result ${currentBuild.result}"
    }
  }
}