

How does the Access Control work in windows?

## Components

- Security Descriptor. The Security Descriptor is simply a all the Access Control rules combinend.
- Security Principal. The Principal that tries to access a file. This is usually a user.

The access control is that the OS checks if the Security Principal is allowed to perform the operation upon on the object. It does this by comparing the Security Descriptor with the Principal.

### Descurity Descriptor
The Security Descriptor is a binary data structure.