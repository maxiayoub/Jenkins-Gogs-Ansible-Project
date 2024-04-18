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
		always{
         	script {
                def emailSubject = "CI Result: Project ${env.JOB_NAME} - Build #${env.BUILD_NUMBER}"
                def emailBody = """
                <b>Status:</b> ${currentBuild.currentResult}<br>
                <b>Project:</b> ${env.JOB_NAME}<br>
                <b>Build Number:</b> ${env.BUILD_NUMBER}<br>
                <b>Build URL:</b> ${env.BUILD_URL}
                """
                
                // Determine email subject based on status
                if (currentBuild.currentResult == 'SUCCESS') {
                    emailSubject = "SUCCESS CI: Project name -> ${env.JOB_NAME}"
                } else {
                    emailSubject = "ERROR CI: Project name -> ${env.JOB_NAME}"
                }

                mail bcc: '', 
                    body: emailBody, 
                    cc: 'maximousfrayoub1@gmail.com', 
                    charset: 'UTF-8', 
                    from: '', 
                    mimeType: 'text/html', 
                    replyTo: '', 
                    subject: emailSubject, 
                    to: "maximousfr.ayoubmehanne@gmail.com"
            }
         }
     }
}