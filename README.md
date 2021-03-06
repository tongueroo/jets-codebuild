# Jets with Codebuild

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

This is an example of a Jets project set up with CI. It uses the [cody tool](https://cody.run/) to set up an AWS CodeBuild project.  There's also a [codebuild jets example](https://codebuild.cloud/docs/examples/jets/).

## Usage

    gem install codebuild # install codebuild tool
    git clone https://github.com/tongueroo/jets-cody-demo
    cd jets-cody-demo # cd into the project folder

## Set up .env

The [.env](.env) file in the project uses SSM parameter store for the `DATABASE_URL` value.  Here's an example put-parameter cli command:

    aws ssm put-parameter --name /jets-cody-demo/development/DATABASE_URL --value "mysql2://user:pass@xxx.us-west-2.rds.amazonaws.com/demo?pool=5" --type SecureString
    aws ssm put-parameter --name /jets-cody-demo/development/CODY_JETS_TOKEN --value "YOUR_ACTUAL_TOKEN" --type SecureString

You'll need to use your own value. You can get a Jets token is by creating an account at [Serverless Gems](https://www.serverlessgems.com/).

## CodeBuild

    cb deploy demo # creates the CodeBuild Project
    cb start demo  # starts a build
    cb start demo -b mybranch  # starts a build on a specific branch. remember to git push

## Other Examples

* [separate unit and deploy projects](https://github.com/tongueroo/jets-cody-demo/tree/separate-unit-and-deploy): Shows how to create separate codebuild projects for unit tests and deploy using the same repo. Some advantages: decoupling the 2 proccess and limit the AWS IAM permissions to create resources only on the deploy project.
