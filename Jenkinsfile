#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
        [$class: 'GitSCMSource',
         remote: 'https://github.com/armughanahmed/clean-shared-library.git',
         credentialsId: 'github'
        ]
)

pipeline {
    agent any

    environment {
        IMAGE_NAME = 'armughanahmed/node-app'
        VERSION = 'major'
        SERVER_CMDS = 'server-cmds'
        EC2_IP = 'ec2-user@35.180.251.121'
    }

    stages {
        stage('increment version') {
            steps {
                script {
                    def packageJSON = readJSON file: './package.json'
                    if (env.VERSION=='patch') {
                        incrementPatch()
                    }
                    else if(env.VERSION=='major'){
                        incrementMinor()
                    }
                    else {
                        incrementMajor()
                    }
                }
            }
        }
        stage('build and push image') {
            steps {
                script {
                    def packageJSON = readJSON file: './package.json'
                    def packageJSONVersion = packageJSON.version
                    buildImage "${packageJSONVersion}"
                }
            }
        }
        // stage('commit version update') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        //                 // git config here for the first time run
        //                 sh 'git config --global user.email "jenkins@example.com"'
        //                 sh 'git config --global user.name "jenkins"'
        //                 sh 'git remote set-url origin git@github.com:${USER}/node-app.git'
        //                 // sh "git remote add origin git@github.com:${USER}/node-app.git"
        //                 sh 'git add .'
        //                 sh "git commit -m 'ci: version bump'"
        //                 sh 'git push origin HEAD:jenkins-job'
        //             }
        //         }
        //     }
        // }
stage('Update GIT') {
  steps {
    script {
      catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
        withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
            def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
            sh "git config user.email admin@example.com"
            sh "git config user.name example"
            sh 'git checkout jenkins-job'
            sh "git add ."
            sh "git commit -m 'Triggered Build: ${env.BUILD_NUMBER}'"
            sh "git push https://${GIT_USERNAME}:${encodedPassword}@github.com/${GIT_USERNAME}/node-app.git"
        }
      }
    }
  }
}
    // stage('deploy') {
    //     steps {
    //         script {
    //             deploy()
    //         }
    //     }
    // }
    // stage('commit version update') {
    //     steps {
    //         script {
    //             commitUpdate()
    //         }
    //     }
    // }
    }
}
