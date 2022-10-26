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
    stage('terraform fmt check...') {
      
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform fmt -check -recursive -list=true -diff'
        }
        
      }
    }
    stage('terraform lint check...') {
      
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'tflint'
        }
        
      }
    }
    stage('terraform plan...') {
      
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform plan'
        }
        
      }
    }
    stage('terraform validate check...') {
      
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform validate'
        }
        
      }
    }
    stage('terraform graph generation...') {
      
      steps {
        dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
            sh 'terraform graph | dot -Tpng > terraform-graph.png'
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
    stage('5 minutes Terraform destroy') {
            when{
                branch "main"
            }
            steps {

                sh 'sleep 300'

                dir('/home/jrivas/proyects/ci-cd-ec2-terraform') {
                sh 'terraform destroy --auto-approve'
                }
                
                       
            }
        }
  }
}