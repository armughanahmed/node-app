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
        VERSION = 'patch'
        SERVER_CMDS = 'server-cmds'
        EC2_IP = 'ec2-user@35.180.251.121'
    }

    stages {
        def packageJSON = readJSON file: 'package.json'
        stage('increment version') {
            when {
                expression {
                    env.VERSION == 'patch'
                }
            }
                steps {
                    script {
                        incrementPatch()
                    }
                }

                when {
                    expression {
                        env.VERSION == 'minor'
                    }
                }
                steps {
                    script {
                        incrementMinor()
                    }
                }
                when {
                    expression {
                        env.VERSION == 'major'
                    }
                }
                steps {
                    script {
                        incrementMajor()
                    }
                }
        }

        stage('build and push image') {
            steps {
                script {
                    buildImage "${packageJSON}"
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
