.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slappw-argon2(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPPW-ARGON2(5)           File Formats Manual          SLAPPW-ARGON2(5)

NAME
-------------------------------------------------

::

          slappw-argon2 - Argon2 password module to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf

                 moduleload argon2 [<parameters>]


---------------------------------------------------------------

::

          The argon2 module to slapd(8) provides support for the use of the
          key derivation function Argon2, that was selected as the winner
          of the Password Hashing Competition in July 2015, in hashed
          passwords in OpenLDAP.

          It does so by providing the additional password scheme {ARGON2}
          for use in slapd.


-------------------------------------------------------------------

::

          The argon2 module does not need any configuration, but it can be
          configured by giving the following parameters:

          m=<memory>
                 Set memory usage to <memory> kiB.

          p=<parallelism>
                 Set parallelism to <parallelism> threads. Currently
                 supported only when linked with libargon2.

          t=<iterations>
                 Set the number of iterations to <iterations>.

          These replace defaults when preparing hashes for new passwords
          where possible.

          After loading the module, the password scheme {ARGON2} will be
          recognised in values of the userPassword attribute.

          You can then instruct OpenLDAP to use this scheme when processing
          the LDAPv3 Password Modify (RFC 3062) extended operations by
          using the password-hash option in slapd.conf(5):

                 password-hash {ARGON2}

      NOTES
          If you want to use the scheme described here with slappasswd(8),
          remember to load the module using its command line options.  The
          relevant option/value is:

                 -o module-load=argon2

          Or if non-default parameters are required:

                 -o module-load="argon2 [<param>...]"

          Depending on argon2's location, you may also need:

                 -o module-path=pathspec


---------------------------------------------------------

::

          Both userPassword LDAP attributes below encode the password
          'secret' using different salts:

          userPassword: {ARGON2}$argon2i$v=19$m=4096,t=3,p=1$c2FsdHNhbHQ$DKlexoEJUoZTmkAAC3SaMWk30El9/RvVhlqGo6afIng

          userPassword: {ARGON2}$argon2i$v=19$m=4096,t=3,p=1$c2FsdHNhbHRzYWx0$qOCkx9nMeFlaGOO4DUmPDgrlUbgMMuO9T1+vQCFuyzw


---------------------------------------------------------

::

          slapd.conf(5), ldappasswd(1), slappasswd(8), ldap(3),

          "OpenLDAP Administrator's Guide" ⟨http://www.OpenLDAP.org/doc/⟩


-------------------------------------------------------------------------

::

          This manual page has been written by Peter Marschall based on the
          module's README file written by Simon Levermann
          ⟨simon@levermann.de⟩.

          OpenLDAP is developed and maintained by The OpenLDAP Project 
          ⟨http://www.openldap.org/⟩.  OpenLDAP is derived from University
          of Michigan LDAP 3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE              SLAPPW-ARGON2(5)

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
