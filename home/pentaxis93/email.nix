{config, ...}: {
  sops.secrets = {
    "rdg-gmail-smtp-password" = {
      owner = config.users.users.pentaxis93.name;
      inherit (config.users.users.pentaxis93) group;
    };
  };

  accounts.email = {
    maildirBasePath = "Mail";

    accounts = {
      rdg-gmail = {
        address = "robert.david.grossman@gmail.com";
        userName = "pentaxis93";
        realName = "Robert Grossman";
        passwordCommand = "cat ${config.sops.secrets."rdg-gmail-smtp-password".path}";
        imap.host = "imap.gmail.com";
        smtp.host = "smtp.gmail.com";
        smtp.tls.useStartTls = true;
      };
    };
  };
}
