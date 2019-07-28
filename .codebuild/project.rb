github_url("https://github.com/tongueroo/demo-test")
linux_image("timbru31/ruby-node:2.5") # linux_image("ruby:2.5.5") # currently must used ruby 2.5
environment_variables(
  JETS_ENV: Codebuild.env,
)
