
The Active Directory physical topology consists of three main components: **site**, **subnet**, and **site link**

## Site

A collection of machines connected of a LAN. This usually means a physical building. A site usually contains a [domain controller](./domain_controller.md), but it doesn't have to. If the site is in an unsecure location, where the physical security of a domain controller can't be assured, the DC might be a Read-only Domain Controller (RODC).

Some services, such as Distributed File System (DFS) and SharePoint are site aware and use the site information-

AD needs at least one site configured. The default site is created when the first domain in your forest is created. 


## Subnet


## Site link

A site link is used to configure which domain controller on a site a user should authenticate against. 

The two main functions it serves are the following:
- The site links control the AD replication between domain controllers.
- Provide a mechanism for a client to discover domain controllers if the DC on site is unavailable.

