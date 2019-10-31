defmodule UsersAccount.Email do
    import Bamboo.Email
      def welcome_email(email_address, account_name) do
      new_email(
        to: email_address,
        from: "orlando.teste.olist@gmail.com",
        subject: "Successful OLIST Registration.",
        html_body: "<H1> Welcome " <> account_name <> "</H1></br>" <>
        "<strong>Thank you for registering with OLIST!</strong>",
        text_body: "Welcome " <> account_name <> ", Thank you for registering with OLIST!"
      )
    end
end