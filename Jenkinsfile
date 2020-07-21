pipeline {
    agent any
    stages {
        stage('Build') {
            when {
                not { 
                	anyOf {
                		branch "production"
                		branch "beta"
                	}
                }
            }
            steps {
                sh 'echo "Entering the build step!"'
            }
        }
        stage('build and tag docker images ') {
            when {
                not { 
                	anyOf {
                		branch "production"
                		branch "beta"
                	}
                }
            }
            steps {
                sh 'echo "building docker images now - not necessary more than once per tag"'
                sh 'echo "now tagging docker images using epoch or git commit"'
            }
        }
        stage('Test') {
            when {
                not { 
                	anyOf {
                		branch "production"
                		branch "beta"
                	}
                }
            }
            steps {
                sh 'echo "testing testing testing"'
                sh 'echo "docker images tested"'
                sh './jenkins/scripts/pass-or-fail.sh'
            }
        }
        stage('Deploy for alpha') {
            when {
                branch 'alpha'
            }
            steps {
                sh './jenkins/scripts/deploy-for-alpha.sh'
                sh './jenkins/scripts/do-the-extra-step-for-feature.sh'
            }
        }
        stage('Deploy for alpha2') {
            when {
                branch 'alpha2'
            }
            steps {
                sh './jenkins/scripts/deploy-for-alpha2.sh'
            }
        }
        stage('Deploy for beta') {
            when {
                branch 'beta'
            }
            steps {
                sh './jenkins/scripts/deploy-for-beta.sh'
                sh './jenkins/scripts/do-the-extra-step-for-feature.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                sh './jenkins/scripts/do-the-extra-step-for-feature.sh'
            }
        }
    }
}
