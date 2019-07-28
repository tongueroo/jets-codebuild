# Jets with Codebuild

This is an example of a Jets project set up with CI. It uses the [codebuild tool](https://codebuild.cloud/) to set up an AWS CodeBuild project.  There's also a [codebuild jets example](https://codebuild.cloud/docs/examples/jets/).

## Usage

    gem install codebuild # install codebuild tool
    git clone https://github.com/tongueroo/jets-codebuild demo
    cd demo # cd into the project folder

## Set up .env

The [.env](.env) file in the project uses SSM parameter store for the `DATABASE_URL` value.  Here's an example put-parameter cli command:

    aws ssm put-parameter --name /demo/development/database_url --value "mysql2://user:pass@xxx.us-west-2.rds.amazonaws.com/demo?pool=5" --type SecureString

You'll need to use your own value.

## CodeBuild

This branch shows how to create 2 separate CodeBuild projects for unit tests and deployment. Some advantages:

* The projects are decouple and you can run them separately.
* Only the deploy project requires IAM access to create the AWS resources.

Unit tests:

    cb deploy demo --type unit # creates the CodeBuild Project
    cb start demo --type unit  # starts a build
    cb start demo --type unit -b separate-unit-and-deploy  # starts a build on a specific branch. remember to git push

Deploy:

    cb deploy demo --type deploy # creates the CodeBuild Project
    cb start demo --type deploy  # starts a build
    cb start demo --type deploy -b separate-unit-and-deploy  # starts a build on a specific branch. remember to git push

## Notes

The [.codebuild/project.rb](.codebuild/project.rb) uses a Docker image that has ruby, node, and yarn already installed.  If you prefer to use another image, update the `linux_image` setting, and update your `buildspec.yml` accordingly. IE: Install the necessary packages.

## Other Examples

* [aws/codebuild/ruby image](https://github.com/tongueroo/jets-codebuild/tree/aws-codebuild-ruby-2-5-3): Uses the AWS CodeBuild image. Since node and yarn is not preinstalled it is installed with in buildspec.yml.