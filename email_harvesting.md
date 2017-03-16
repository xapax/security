# Identifying People

We want to find out how is connected to the target. That can be site administrator, employees, owner, mods. Maybe one of the administrators have posted in a forum with their email, or in a newsgroup or somewhere else. Those posts could contain useful data about the stack or help us devlop a network diagram. We might also need to use social engineering.

In order to find people we might use the following sources:

* The company website
* Social media \(LinkedIn, Facebook, Twitter etc\)
* Forums and newsgroups
* Metadata from documents

### Company Website

This is pretty obvious. Just look around on the website. Or download it. Or spider it with burp and then search the result.

Make sure to check out the blog. There you might have employees writing blogposts under their name.

### Social Media

```
site:twitter.com companyname
site:linkedin.com companyname
site:facebook.com companyname
```

### Metadata From Documents

You find some documents and then run exiftool on them to see if there is any interesting metadata.

```
site:example.com filetype:pdf
```

## Email Harvesting

theharvester - I have not had luck with this

```
theharvester -d example.com -l 500 -b all
```

## Check if emails have been pwned before

[https://haveibeenpwned.com](https://haveibeenpwned.com)

# Users

social-searcher.com

Reddit  
Snoopsnoo

