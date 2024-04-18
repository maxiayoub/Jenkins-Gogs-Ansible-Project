pipeline {
    agent any 
    environment{
	SMTP_PASSWORD=credentials('email_password')
    }
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
			sh "ssh -o StrictHostKeyChecking=no root@192.168.44.21 'chmod +x GroupMembers.sh'"
            		sh "ssh -o StrictHostKeyChecking=no root@192.168.44.21 'bash GroupMembers.sh'"
        		}
    		}
		}

    }
	post {
		always{
         	script {
		ansiblePlaybook credentialsId: 'ansible_key', playbook: 'EmailNotify.yml', extras: "--extra-vars='execution_status=${currentBuild.result}'"
		sh "./Email_Bash.sh ${currentBuild.result}"
                def message = "Pipeline executed on: ${new Date().format('YYYY-MM-dd HH:mm:ss')}\n" +
                              "Pipeline Status: ${currentBuild.result}\n" +
                              "Users in nginxG group: ${users}"
                mail to: 'maximousfr.ayoubmehanne@gmail.com',
                     subject: "Jenkins Pipeline Notification",
                     body: message
            }
         }
     }
}
