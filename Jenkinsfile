pipeline {
    agent any 
    
        stages {
        stage('checkout') {
            steps {

            
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
                   serverId: 'myartifactory2', 
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
                stage('copy to tomcat ') {
                    steps {
                      sh '  cp /var/lib/jenkins/workspace/22sec/target/hello-world-war-2.0.2.war /opt/apache-tomcat-8.5.90/webapps/ '    
            }
       }
   }
}
            
