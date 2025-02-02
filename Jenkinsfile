pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        
        stage('Clean ws') {
            steps {
                cleanWs()
            }
        }
        
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/saurabh7nt/git-jenkins-terraform-ansible.git'
            }
        }
        
        stage('Initialize Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        
        // stage('Fetch EC2 IP') {
        //     steps {
        //         dir('terraform') {
        //             script {
        //                 def instanceIp = sh(
        //                     script: "terraform output -raw instance_public_ip",
        //                     returnStdout: true
        //                 ).trim()
        //                 env.INSTANCE_IP = instanceIp
        //                 echo "Fetched EC2 Public IP: ${env.INSTANCE_IP}"
        //             }
        //         }
        //     }
        // }

        // stage('Wait for SSH') {
        //      steps {
        //         withCredentials([file(credentialsId: 'demo_ssh_key', variable: 'SSH_KEY')]) {
        //             sh '''
        //                 echo "Waiting for instance to be ready..."
        //                 chmod 400 $SSH_KEY
        //                 until ssh -i $SSH_KEY -o StrictHostKeyChecking=no ubuntu@${INSTANCE_IP} "echo Instance ready"; do
        //                   echo "Instance not ready yet. Retrying in 5 seconds..."
        //                   sleep 5
        //                 done
        //             '''
        //         }
        //     }
        // }

        stage('sleep 15s'){
            steps {
                dir('ansible') {
                    echo 'Waiting for instances to get ready...'
                    sh 'sleep 15s'
                }
            }
        }


        
        stage('Run Ansible Playbook with Dynamic Inventory') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i aws_ec2.yml playbook.yml -u ubuntu --private-key /home/saurabh/key-pair/Demo_key.pem'
                }
            }
        }

        // stage('Ping Ansible') {
        //     steps {
        //         dir('ansible') {
        //             sh 'ansible -i inventory.txt web_servers -m ping'
        //         }
        //     }
        // }
        
        //  stage('Run Ansible') {
        //     steps {
        //         dir('ansible') {
        //             echo "Running Ansible to configure the infrastructure..."
        //             sh 'ansible-playbook -i inventory.txt playbook.yml'
        //         }
        //     }
        // }
        
    }
}
