def artifact1name = "sa-web1.jar"
def artifact1url = "https://artifact.devsnc.com/content/groups/devcom/sa/web/sentiment-analysis-web"
def artifact1Version = "3.3"
def artifact1VersionUrl = "https://artifact.devsnc.com/content/groups/devcom/sa/web/sentiment-analysis-web/3.3-snapshot/sa-web-3.3.jar"
def artifact1SemVersion ="3.3.0"
def artifact2name = "sa-frontend.jar"
def artifact2url = "https://artifact.devsnc.com/content/groups/dev/com/sa/sentiment-frontend"
def artifact2Version = "3.4"
def artifact2VersionUrl ="https://artifact.devsnc.com/content/groups/dev/com/sa/sentiment-frontend/3.4-snapshot/sa-web-3.4.jar"
def artifact2SemVersion="3.4.0"
def repoUrl= "https://artifact.devsnc.com/content/repositories/services-1031"
def repoName = "services-1031"
pipeline {
    agent any
    tools {
       maven 'Maven'
    }
    stages {
        stage('Build') {
            steps {
                snDevOpsStep()
                echo 'Building..'
                echo "Pipeline name is ${env.JOB_NAME}"
        echo "Pipeline run rumber is ${env.BUILD_NUMBER}"
        echo "Stage name is ${env.STAGE_NAME}"
            echo "GIT branch is ${env.GIT_BRANCH}"
                echo "globalprops -- ${env.snartifacttoolid} -- ${env.snhost} -- ${env.snuser} -- ${env.snpassword} ";
        sh 'mvn compile'
                sh 'mvn verify'
        }
            post {
                success {
                    junit '**/target/surefire-reports/*.xml' 
                }
            }
        }
        stage('Deploy') {
                steps {
                snDevOpsStep()
                snDevOpsChange()
            }
        }
    }
}
