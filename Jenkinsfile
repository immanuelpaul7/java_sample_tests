def semanticVersion = "${env.BUILD_NUMBER}.0.0-HOTFIX1"
def packageName = "sample_devops-package_${env.BUILD_NUMBER}"
def version = "${env.BUILD_NUMBER}.0"
pipeline {
   agent any
   tools {
      maven 'Maven'
   }
   stages {
      
       stage("build") {
                steps {
                    snDevOpsStep ()
                    echo "Building" 
                    sh 'mvn -X clean install -DskipTests'
                    sleep 5
                }
       }
      
      stage("test") {
           steps {
               snDevOpsStep ()
               echo "Testing"
               sh 'mvn test'
               sleep 3
           }
          post {
                always {
                    junit '**/target/surefire-reports/*.xml' 
                }
          }
        }
    
      stage("deploy") {
             steps{
                  snDevOpsStep ()
                  echo "deploy in prod"
                  echo "deploy in prod"
                  //snDevOpsChange()              
                  snDevOpsChange(changeRequestDetails: """
                  {
                     "setCloseCode":false,
                     "attributes":{
                        "requested_by":{
                           "name":"test user1"
                        },
                        "category":"Service",
                        "sys_created_by": {
                           "name":"test user2"
                        },
                        "priority":"2",
                        "comments": "This update for work notes is from jenkins file",
                        "work_notes": "Update this to work_notes",
                        "start_date":"2021-01-05 08:00:00",
                        "end_date":"2021-01-08 08:00:00"
                     }
                  }
                  """)                
              }
      }  
  }
}
