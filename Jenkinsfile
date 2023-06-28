pipeline {
    agent any 
    
        stages {
        stage('checkout') {
            steps {

                sh ' rm -rf hello-world-war '
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
                stage('copy to tomcat ') {
                    steps {
                      sh ' scp  /home/ubuntu/var/lib/jenkins/workspace/21sec/target/hello-world-war-2.0.1.war  root@ip-172-31-43-42:/opt/apache-tomcat-8.5.90/webapps/ '    
            }
       }
   }
}
            
