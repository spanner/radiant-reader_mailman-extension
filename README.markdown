# reader_mailman extension

This is a very simple radiant extension that lets your readership populate a mailman mailing lists, opt in and out and set their message-receipt preferences. It will soon include the ability to assign a different list to each reader-group but right now it's just a single global list.

## Requirements

* The [reader extension](https://github.com/spanner/radiant-reader-extension) to provide for your user-management and access-control needs.

* A Mailman installation [configured to use MySQL for membership data](http://loeki.tv/log/archives/81-Setting-up-Mailman-to-store-members-in-a-MySQL-database.html), at least for the lists you want to populate. Note that the database must be set up in the 'wide' configuration, ie. one table per list.

## Configuration

We access the mailman table through activerecord using a separate database connection called `mailman_#{RAILS_ENV}`. Add definitions like these to your database.yml:

    mailman_development:
      adapter: mysql2
      database: mailman
      username: somebody
      password: whatever
      host: 127.0.0.1
    
    mailman_production:
      adapter: mysql2
      database: mailman
      username: somebody
      password: whatever
      host: mail.server.com

You store the name of the mailing list (which is also the name of the data table) in:

    reader.mailman.list_name
    
You can do that through the usual reader-settings interface.

## Status

New but reasonably simple. The legacy interface involves some subversion of ActiveRecord so bugs are possible there.

## Bugs and comments

Issues in github, please, or for little things an email or github message is fine.

## Author and copyright

* Copyright Spanner Ltd 2011.
* Released under the same terms as Rails and/or Radiant.
* Contact will at spanner.org
