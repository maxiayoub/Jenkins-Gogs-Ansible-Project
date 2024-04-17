pipeline {
    agent any 
    stages {
        stage('Test Hello') {
            steps {
                echo 'Hello world!' 
            }
        }
		stage('Running Ansible')
			steps{
				ansiblePlaybook credentialsId: 'ansible_key', inventory: 'inventories/hosts', playbook: 'InstallNginx.yml'
			}
    }
}
