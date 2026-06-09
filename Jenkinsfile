pipeline {

    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {

        stage('Checkout Develop Branch') {
            steps {
                git branch: 'develop', url: 'https://github.com/manju230/demo-s3-deployment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -no-color'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Clean console output
                sh 'terraform plan -no-color -out=tfplan | tee plan.log'

                // Proper structured output
                sh 'terraform show -no-color tfplan > plan.txt'
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: 'plan.txt', fingerprint: true
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Approve'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -no-color -auto-approve tfplan'
            }
        }

    }
}
