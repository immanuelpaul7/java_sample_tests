def artifact1name = "sa-web.jar"
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
        stage('CI') {
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
        sh """
curl -X POST \
-H "content-type: application/json" \
-d '{"artifacts":[ \
{"name":"${artifact1name}","url":"${artifact1url}","version":"${artifact1Version}", \
"versionUrl":"${artifact1VersionUrl}", "repositoryUrl":"${repoUrl}","repositoryName":"${repoName}", \
"semanticVersion": "${artifact1SemVersion}"}, \
{"name":"${artifact2name}","url":"${artifact2url}","version":"${artifact2Version}", \
"versionUrl":"${artifact2VersionUrl}", "repositoryUrl":"${repoUrl}","repositoryName":"${repoName}", \
"semanticVersion": "${artifact2SemVersion}"}], \
"pipelineName": "${env.JOB_NAME}","taskExecutionNumber": "${env.BUILD_NUMBER}", "stageName": "${env.STAGE_NAME}", \
"branchName": "${env.GIT_BRANCH}"}' \
 http://${env.snuser}:${env.snpassword}@${env.snhost}/api/sn_devops/devops/artifact/registration?toolId=${env.snartifacttoolid}
                """
        }
            post {
                success {
                    junit '**/target/surefire-reports/*.xml' 
                }
            }
        }
        stage('UAT deploy') {
            steps {
                snDevOpsStep()
                sh 'mvn package'
            }
        }
        stage('UAT test') {
            stages {
                stage('UAT unit test') {
                    steps {
                        snDevOpsStep()
                        sh 'mvn compile'
                        sh 'mvn verify'
                    }
                    post {
                        success {
                            junit '**/target/surefire-reports/*.xml' 
                        }
                    }
                }
                stage('UAT static code test') {
                    steps {
                        snDevOpsStep()
                        sh 'mvn compile'
                        sh 'mvn verify'
                    }
                    post {
                        success {
                            junit '**/target/surefire-reports/*.xml' 
                        }
                    }
                }
            }
        }
        stage('PROD') {
            stages {
                stage('deploy UAT') {
                    when {
                        branch 'dev'
                    }
                    steps {
                        snDevOpsStep()
                    }
                }
                stage('deploy PROD') {
                    when {
                        branch 'master'
                    }
                    steps {
                        snDevOpsStep()
                        snDevOpsChange()
                    }
                }
            }
        }
    }
}
