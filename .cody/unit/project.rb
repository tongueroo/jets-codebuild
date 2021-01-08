github_url("https://github.com/tongueroo/jets-cody-demo")
linux_image("aws/codebuild/amazonlinux2-x86_64-standard:3.0")
environment_variables(
  JETS_ENV: Cody.env,
  JETS_TOKEN: ssm("/jets-cody-demo/#{Cody.env}/CODY_JETS_TOKEN"),
)
