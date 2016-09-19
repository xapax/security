# Truncating mysql vulerability

Basically this happens when you don't validate the length of user input. 
Two things are needed for it to work:

- Mysql does not make comparisons in binary mode. This means that "admin" and "admin        " are the same.

- If the username column in the database has a character-limit the rest of the characters are truncated, that is removed. So if the database has a column-limit of 20 characters and we input a string with 21 characters the last 1 character will be removed.

With this information we can create a new admin-user and have our own password set to it. So if the max-length is 20 characters we can inser teh following string

```
admin               removed
```
This means that the "removed" part will be removed/truncated/deleted. And the trailing spaces will be removed upon insert in the database. So it will effectivly be inserted as "admin".



## References

http://resources.infosecinstitute.com/sql-truncation-attack/