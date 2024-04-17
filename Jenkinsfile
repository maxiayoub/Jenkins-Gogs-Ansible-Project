pipeline {
    agent any 
    stages {
        stage('Test Hello') {
            steps {
                echo 'Hello world!' 
            }
        }
		stage('Running Ansible'){
			steps{
				ansiblePlaybook credentialsId: 'ansible_key', inventory: 'inventories/hosts', playbook: 'InstallNginx.yml'
			}
		}
		stage('Copy GroupMembers.sh to VM3'){
			steps{
        		sshagent(['ansible_key']){
					sh "scp GroupMembers.sh root@192.168.44.21:"
            		sh "ssh -o StrictHostKeyChecking=no root@192.168.44.21 'bash GroupMembers.sh'"
        		}
    		}
		}
    }
	post {
         always {
             echo 'Project Status:'
         }
         success {
             echo 'Pipline is Compiled Successfuly.'
         }
         failure {
             echo 'Pipeline Failed.'
             // Sending an email notification with details about the failure
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: 'ganesh_1@mail.com', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "ganesh_2@mail.com";
         }
         unstable {
             echo 'The Run is marked as Unstable'
         }
     }
}