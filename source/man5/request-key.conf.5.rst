.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

request-key.conf(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   REQUEST-KEY.CONF(5)  Linux Key Management Utilities  REQUEST-KEY.CONF(5)

NAME
-------------------------------------------------

::

          request-key.conf - Instantiation handler configuration file


---------------------------------------------------------------

::

          These files are used by the /sbin/request-key program to
          determine which program it should run to instantiate a key.

          request-key looks for the best match, reading all the following
          files:

                      /etc/request-key.d/*.conf
                      /etc/request-key.conf

          If it doesn't find a match, it will return an error and the
          kernel will automatically negate the key.

          The best match is defined as the line with the shortest wildcard
          skips, ranking the columns in order left to right.  If two lines
          have the same length skips, then the first read is the one taken.

          In the files, any blank line or line beginning with a hash mark
          '#' is considered to be a comment and ignored.

          All other lines are assumed to be command lines with a number of
          white space separated fields:

          <op> <type> <description> <callout-info> <prog> <arg1> <arg2> ...

          The first four fields are used to match the parameters passed to
          request-key by the kernel. op is the operation type; currently
          the only supported operation is "create".

          type, description and callout-info match the three parameters
          passed to keyctl request2 or the request_key() system call.  Each
          of these may contain one asterisk '*' character as a wildcard
          anywhere within the string.

          Should a match be made, the program specified by <prog> will be
          exec'd. This must have a fully qualified path name. argv[0] will
          be set from the part of the program name that follows the last
          slash '/' character.

          If the program name is prefixed with a pipe bar character '|',
          then the program will be forked and exec'd attached to three
          pipes. The callout information will be piped to it on it's stdin
          and the intended payload data will be retrieved from its stdout.
          Anything sent to stderr will be posted in syslog. If the program
          exits 0, then /sbin/request-key will attempt to instantiate the
          key with the data read from stdout. If it fails in any other way,
          then request-key will attempt to execute the appropriate 'negate'
          operation command.

          The program arguments can be substituted with various macros.
          Only complete argument substitution is supported - macro
          substitutions can't be embedded. All macros begin with a percent
          character '%'. An argument beginning with two percent characters
          will have one of them discarded.

          The following macros are supported:

                 %o    Operation type
                 %k    Key ID
                 %t    Key type
                 %d    Key description
                 %c    Callout information
                 %u    Key UID
                 %g    Key GID
                 %T    Requestor's thread keyring
                 %P    Requestor's process keyring
                 %S    Requestor's session keyring

          There's another macro substitution too that permits the
          interpolation of the contents of a key:

                 %{<type>:<description>}

          This performs a lookup for a key of the given type and
          description on the requestor's keyrings, and if found,
          substitutes the contents for the macro. If not found an error
          will be logged and the key under construction will be negated.


-------------------------------------------------------

::

          A basic file will be installed in the /etc. This will contain two
          debugging lines that can be used to test the installation:

                 create user debug:* negate /bin/keyctl negate %k 30 %S
                 create user debug:loop:* * |/bin/cat
                 create user debug:* *
                 /usr/share/keyutils/request-key-debug.sh %k %d %c %S
                 negate * * * /bin/keyctl negate %k 30 %S

          This is set up so that something like:

                 keyctl request2 user debug:xxxx negate

          will create a negative user-defined key, something like:

                 keyctl request2 user debug:yyyy spoon

          will create an instantiated user-defined key with "Debug spoon"
          as the payload, and something like:

                 keyctl request2 user debug:loop:zzzz abcdefghijkl

          will create an instantiated user-defined key with the callout
          information as the payload.


---------------------------------------------------

::

          /etc/request-key.conf
          /etc/request-key.d/*.conf


---------------------------------------------------------

::

          keyctl(1), request-key.conf(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the keyutils (key management utilities)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to
          keyrings@linux-nfs.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux                       15 November 2011         REQUEST-KEY.CONF(5)

--------------

Pages that refer to this page: `keyctl(1) <../man1/keyctl.1.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`request-key.conf(5) <../man5/request-key.conf.5.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`keyutils(7) <../man7/keyutils.7.html>`__, 
`key.dns_resolver(8) <../man8/key.dns_resolver.8.html>`__, 
`request-key(8) <../man8/request-key.8.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
