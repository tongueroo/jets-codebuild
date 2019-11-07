github_url("https://github.com/tongueroo/jets-codebuild")
linux_image("timbru31/ruby-node:2.5") # currently must used ruby 2.5 for Lambda
environment_variables(
  JETS_ENV: Cody.env,
)
