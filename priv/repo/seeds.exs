# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AwfulHousingNz.Repo.insert!(%AwfulHousingNz.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias AwfulHousingNz.User
AwfulHousingNz.Repo.insert!(%User{email: "user1@example.com", first_name: "Test", last_name: "Test"})
