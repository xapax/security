## 

There are some default groups in Active Directory. Those groups are found in two containers: `Builtin` and in `Users`. The groups in Builtin are analogous to the local groups found on a Windows Server. The AD specific groups are instead found in the container `Users`.

All the groups have SIDs that are well known, and the same SID in every AD.

Both `Builtin` and `Users` are containers but not OUs. That is deliberate, because Group Policies can't be applied containers. So you can't accidentally apply a GPO to those containers.

In a sense the `Builtin` groups are a legacy feature, and many of the groups are not really appropriate. For example,  


## Builtin groups

### Operators

**Account Operators**

