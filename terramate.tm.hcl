terramate {
  required_version = "~> 0.8.2"
  # required_version = "~> 0.9.0-rc1"

  config {
    run {
      env {
     }
    }

    git {
      default_branch = "terramate-test"
      default_remote = "origin"

      check_untracked   = false
      check_uncommitted = false
      check_remote      = false
    }
  }
}