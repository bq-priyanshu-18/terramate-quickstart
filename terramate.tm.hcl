terramate {
  required_version = "~> 0.8.4"

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