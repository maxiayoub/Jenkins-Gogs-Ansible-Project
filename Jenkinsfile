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
}