#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
        [$class: 'GitSCMSource',
         remote: 'https://github.com/armughanahmed/clean-shared-library.git',
         credentialsId: 'github'
        ]
)
def commit_id
pipeline {
    agent any
    environment {
        IMAGE_NAME = 'armughanahmed/node-app'
        VERSION = 'patch'
        SERVER_CMDS = 'server-cmds'
        EC2_IP = 'ec2-user@54.177.111.247'
    }
    stages {
        stage('Preparation') {
            steps {
                script {
                    checkOut();
                }
            }
        }
        // stage('increment version') {
        //     steps {
        //         script {
        //             def packageJSON = readJSON file: './package.json'
        //             if (env.VERSION=='patch') {
        //                 incrementPatch()
        //             }
        //             else if(env.VERSION=='major'){
        //                 incrementMinor()
        //             }
        //             else {
        //                 incrementMajor()
        //             }
        //         }
        //     }
        // }
        // stage('commit version update') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'gitlab-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        //                 // git config here for the first time run
        //                 sh 'git config --global user.email "jenkins@example.com"'
        //                 sh 'git config --global user.name "jenkins"'

        //                 sh "git remote set-url origin https://${USER}:${PASS}@gitlab.com/nanuchi/java-maven-app.git"
        //                 sh 'git add .'
        //                 sh 'git commit -m "ci: version bump"'
        //                 sh 'git push origin HEAD:jenkins-jobs'
        //             }
        //         }
        //     }
        // }

        stage('build and push image') {
            steps {
                script {
                    // def packageJSON = readJSON file: './package.json'
                    // def packageJSONVersion = packageJSON.version
                    buildImage "${commit_id}"
                }
            }
        }
// stage('Update GIT') {
//   steps {
//     script {
//     //   catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
//         withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
//                             // git config here for the first time run
//                             // sh 'echo $(git status)'
//                         sh 'git config --global user.email "armughan.ahmed@yahoo.com"'
//                         sh 'git config --global user.name "armughanahmed"'
//                         // sh 'git branch -f jenkins-job'  
//                         // sh 'git checkout jenkins-job'
//                         // sh 'git rebase jenkins-job'
//                         sshagent(['jenkins-git']) {
//                         sh 'git add .'
//                         sh "git commit -a -m 'ci: version bump'"
//                         sh 'git remote set-url origin git@github.com:armughanahmed/node-app.git'
//                         sh 'git push origin jenkins-job'
//                         }
//                         // sh 'git remote set-url origin https://github.com/armughanahmed/node-app.git'
//                         // sh 'git push origin jenkins-job'
//                         // sh 'git push --tag'
//                         // sh 'git add .'
//                         // sh "git commit -a -m 'ci: version bump'"
//                         // sh 'git push origin jenkins-job'
//                         // sh "git remote set-url origin git@github.com:armughanahmed/node-app.git"
//                         // sh 'git add .'
//                         // sh 'git commit -m "ci: version bump"'
//                         // sh 'git push origin HEAD:jenkins-jobs'

//         }
//     //   }
//     }
//   }
// }
stage('deploy') {
            steps {
                script {
                    // def packageJSON = readJSON file: './package.json'
                    // def packageJSONVersion = packageJSON.version
                    sh "echo ${commit_id}"
                    // deploy "${commitId}"
                }
            }
        }
    }
}
