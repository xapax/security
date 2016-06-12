# recon-ng
Recon-ng is a recognissance-tool that can be used to enumerate subdomains and many other things.

1. Create a workspace
- We should first start a new workspace. FOr the project we are working on.

`workspace add test.com`

Now we can start using modules, with the `use` command.

It follows this pattern, using outcomplete.

`use recon/domains-contacts/pgp_search`

Then we can look at the options.

`show options`

Then set the options

`set source test.com`

If you have already set a workspace the source default will be test.com

To run the module we just run
`run`

Then the hosts, or contacts table might be updated. Depending on what is found. We can see what is updated by looking at the dashboard.

`show dashboard`

Then:

`show hosts`