pipeline {
    agent any 
    
        stages {
        stage('checkout') {
            steps {

                sh ' rm -rf /var/lib/workspace/hello-world-war '
                sh 'git clone https://github.com/codemonisha/hello-world-war.git'
            }
        }

         stage('build') {
            steps {
                sh 'mvn package '

            }
        }
       stage('Push artifacts into artifactory') {
           steps { 
               rtUpload ( 
                   serverId: 'myartifactory1', 
                   spec: '''{ 
                       "files": [ 
                           { 
                               "pattern": "*.war", 
                                "target": "example-repo-local/" 
                   } 
                   ] 
                   }''' 
               )	 
           }	
       }     
      }
}
