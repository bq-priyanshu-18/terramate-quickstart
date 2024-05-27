terramate {
  # required_version = "~> 0.8.4"
  required_version = "~> 0.9.0-rc1"

  config {
    run {
      env {
     }
    }

    git {
      default_branch = "terramate-test"
      default_remote = "origin"
    }
  }
}