# KanbanSurvey

###Before to continue with the next steps run the following from console:
    $ git clone git@github.com:david-vega/class_scheduler.git
    $ cd class_scheduler
    $ bundle install
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed

#Note:
The current db configuration uses your system user name as the pg user without password. to create it please run:

    sudo -u postgres createuser YOUR_SYSTEM_USER -s

Make sure in your ```/etc/postgresql/PG_VERSION/main/pg_hba.conf``` to add the local env to the trusted sites like:

    # "local" is for Unix domain socket connections only
    local   all             all                                     trust
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            trust
    # IPv6 local connections:
    host    all             all             ::1/128                 trust
