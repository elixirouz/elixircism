data = %{
  "team_mascot" => %{
    "animal" => "bear",
    "actor" => %{
      "first_name" => "Noel"
    }
  }
}

# This is where the `extract_from_path/2` function is invoked
BasketballWebsite.extract_from_path(data, "team_mascot.actor.first_name.a1.a2")
