alias Studio.Repo
alias Studio.Servers.Server

%Server{
  git_repo: "http//macaco.com",
  name: "Monkey-1",
  status: "up"
} |> Repo.insert!()

%Server{
  git_repo: "http//alpha.com",
  name: "Alpha Macaco",
  status: "up"
} |> Repo.insert!()

%Server{
  git_repo: "http//sapo.com",
  name: "Sapinho-Primo",
  status: "up"
} |> Repo.insert!()
