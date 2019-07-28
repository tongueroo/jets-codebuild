github_url("https://github.com/tongueroo/demo-test")
linux_image("aws/codebuild/ruby:2.5.3-1.7.0") # currently must used ruby 2.5
environment_variables(
  JETS_ENV: Codebuild.env,
)
