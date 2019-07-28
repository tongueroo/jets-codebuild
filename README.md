# Jets with Codebuild

This is an example of a Jets Project set up with AWS CodeBuild using the [codebuild tool](https://codebuild.cloud/).

## Usage

    gem install codebuild # install codebuild tool
    git clone https://github.com/tongueroo/jets-codebuild demo
    cd demo # cd into the project folder

## CodeBuild

    cb deploy demo # creates the CodeBuild Project
    cb start demo  # starts a build
    cb start demo -b mybranch  # starts a build on a specific branch. remember to git push
