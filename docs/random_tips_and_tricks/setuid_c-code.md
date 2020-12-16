# Setuid c-code



Sometimes you need setuid code. Here is a great snippet for it.

https://gist.github.com/jblyberg/3899599

```
#include <unistd.h>
#include <errno.h>

main( int argc, char ** argv, char ** envp )
{
              if( setgid(getegid()) ) perror( "setgid" );
              if( setuid(geteuid()) ) perror( "setuid" );
              envp = 0; /* blocks IFS attack on non-bash shells */
              system( "/path/to/bash/script", argv, envp );
              perror( argv[0] );
              return errno;
}
```