# Downloads

This is a very simple extension that lets your reader groups populate mailman mailing lists. Admin configuration is per-group, but individual readers can opt out.

## Requirements

Mailman installation configured to use MySQL for membership data, at least for the lists you want to populate.

## Configuration

Database connection is configured globally. List/group relations are configured at the group level. Individual readers can opt out or make some minor changes to their list membership.

### global settings

    reader.mailman_mysql.host
    reader.mailman_mysql.port
    reader.mailman_mysql.username
    reader.mailman_mysql.password

## Status

New but reasonably simple.

## Bugs and comments

Issues in github, please, or for little things an email or github message is fine.

## Author and copyright

* Copyright spanner ltd 2011.
* Released under the same terms as Rails and/or Radiant.
* Contact will at spanner.org
