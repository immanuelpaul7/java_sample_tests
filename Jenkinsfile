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
                        "sys_created_by": "1832fbe1d701120035ae23c7ce610369",
                        "sys_updated_by": "56826bf03710200044e0bfc8bcbe5dca",              
                        "requested_by":{
                           "name":"test user1"
                        },
                         "watch_list": [{"name":"test user1"}, {"name":"test user2"}, {"name":"Alejandra Prenatt"}, "56826bf03710200044e0bfc8bcbe5dca"],
                         "work_notes_list": ["56826bf03710200044e0bfc8bcbe5dca", "46c6f9efa9fe198101ddf5eed9adf6e7", "d8f57f140b20220050192f15d6673a98"],
                         "assigned_to": "1832fbe1d701120035ae23c7ce610369",
                        "category":"Service",
                        "sys_created_on": "2021-02-09 18:58:41",
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
