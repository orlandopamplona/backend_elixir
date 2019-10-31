alias UsersAccount.Repo
alias UsersAccount.Management.User

Repo.insert! %User{
    name: "user_test_01",
    password: "olist1234",
    mail: "user_test_01@olist.com"
}

Repo.insert! %User{
    name: "user_test_02",
    password: "olist1234",
    mail: "user_test_02@olist.com"
}

Repo.insert! %User{
    name: "user_test_03",
    password: "olist1234",
    mail: "user_test_03@olist.com"
}