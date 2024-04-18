import groovy.transform.Field
@Field
def users;
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
				script{
        			sshagent(['ansible_key']){
						sh "scp GroupMembers.sh root@192.168.44.21:"
						sh "ssh -o StrictHostKeyChecking=no root@192.168.44.21 'chmod +x GroupMembers.sh'"
            			users = sh(script: "ssh -o StrictHostKeyChecking=no root@192.168.44.21 'bash GroupMembers.sh'", returnStdout: true)
					}
        		}
    		}
		}

    }
	post {
        always {
            script {
                // Define email body
                def emailBody = """
                    Pipeline executed on: ${new Date().format('YYYY-MM-dd HH:mm:ss')}
                    Pipeline Status: ${currentBuild.result ?: 'Unknown'}
                    Users in nginxG group: ${users}
                """
                // Call the email function for each method
                sendEmail("Bash", emailBody)
                sendEmail("Ansible", emailBody)
                sendEmail("Jenkins", emailBody)
            }
        }
    }
}

def sendEmail(method, body) {
    // Execute method-specific logic
    switch (method) {
        case "Bash":
	    sh "./Email_Bash.sh '${body}'"
            break
        case "Ansible":
            ansiblePlaybook credentialsId: 'ansible_key', playbook: 'EmailNotify.yml', extraVars: [emailBody: body]
            break
        case "Jenkins":
            mail to: 'maximousfr.ayoubmehanne@gmail.com', subject: "Jenkins Pipeline Notification", body: body
            break
        default:
            echo "Invalid method: ${method}"
    }
}
