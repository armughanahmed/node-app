#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
        [$class: 'GitSCMSource',
         remote: 'https://github.com/armughanahmed/clean-shared-library.git',
         credentialsId: 'github'
        ]
)
//lol
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'armughanahmed/node-app'
        VERSION = 'patch'
        SERVER_CMDS = 'server-cmds'
        EC2_IP = 'ec2-user@54.177.111.247'
    }

    stages {
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
        // stage('build and push image') {
        //     steps {
        //         script {
        //             def packageJSON = readJSON file: './package.json'
        //             def packageJSONVersion = packageJSON.version
        //             buildImage "${packageJSONVersion}"
        //         }
        //     }
        // }
        stage('commit version update') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        // git config here for the first time run
                        sh 'npm version patch'
                        sh 'git config --global user.email "jenkins@example.com"'
                        sh 'git config --global user.name "jenkins"'
                        sh 'git remote set-url origin git@github.com:${USER}/node-app.git'
                        // sh "git remote add origin git@github.com:${USER}/node-app.git"
                        sh 'git add .'
                        sh "git commit -m 'ci: version bump'"
                        sh 'git push origin HEAD:jenkins-job'
                    }
                }
            }
        }
// stage('Update GIT') {
//   steps {
//     script {
//     //   catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
//         withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
//                             // git config here for the first time run
//                             sh 'echo $(git status)'
//                         // sh 'git config --global user.email "armughan.ahmed@yahoo.com"'
//                         // sh 'git config --global user.name "armughanahmed"'
//                         // sh 'git remote set-url origin https://github.com/armughanahmed/node-app.git'
//                         // // sh "git remote add origin git@github.com:${USER}/node-app.git"
//                         // sh 'git add .'
//                         // sh "git commit -m 'ci: version bump'"
//                         // sh 'git push origin HEAD:jenkins-job'
//         }
//     //   }
//     }
//   }
// }
// stage('deploy') {
//             steps {
//                 script {
//                    deploy()
//                 }
//             }
//         }


        // stage('deploy') {
        //     steps {
        //         script {
        //            echo 'deploying docker image to EC2...'

        //         //    def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
        //         //    def ec2Instance = "ec2-user@54.177.111.247"
        //             def dockerCmd= "docker run -p 3002:8080 -d ${IMAGE_NAME}"
        //            sshagent(['ec2-server-key']) {
        //             //    sh "scp server-cmds.sh ${ec2Instance}:/home/ec2-user"
        //                sh "ssh -o StrictHostKeyChecking=no ${EC2_IP} ${dockerCmd}"
        //            }
        //         }
        //     }
        // }

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
