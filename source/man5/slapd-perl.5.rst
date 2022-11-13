.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapd-perl(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `AC                               |                                   |
| CESS CONTROL <#ACCESS_CONTROL>`__ |                                   |
| \| `WARNING <#WARNING>`__ \|      |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPD-PERL(5)              File Formats Manual             SLAPD-PERL(5)

NAME
-------------------------------------------------

::

          slapd-perl - Perl backend to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The Perl backend to slapd(8) works by embedding a perl(1)
          interpreter into slapd(8).  Any perl database section of the
          configuration file slapd.conf(5) must then specify what Perl
          module to use.  Slapd then creates a new Perl object that handles
          all the requests for that particular instance of the backend.

          You will need to create a method for each one of the following
          actions:

            * new        # creates a new object,
            * search     # performs the ldap search,
            * compare    # does a compare,
            * modify     # modifies an entry,
            * add        # adds an entry to backend,
            * modrdn     # modifies an entry's rdn,
            * delete     # deletes an ldap entry,
            * config     # module-specific config directives,
            * init       # called after backend is initialized.

          Unless otherwise specified, the methods return the result code
          which will be returned to the client.  Unimplemented actions can
          just return unwillingToPerform (53).

          new    This method is called when the configuration file
                 encounters a perlmod line.  The module in that line is
                 then effectively `use'd into the perl interpreter, then
                 the new method is called to create a new object.  Note
                 that multiple instances of that object may be
                 instantiated, as with any perl object.  The new method
                 receives the class name as argument.

          search This method is called when a search request comes from a
                 client.  It arguments are as follows:
                   * object reference
                   * base DN
                   * scope
                   * alias dereferencing policy
                   * size limit
                   * time limit
                   * filter string
                   * attributes only flag (1 for yes)
                   * list of attributes to return (may be empty)

          Return value: (resultcode, ldif-entry, ldif-entry, ...)

          compare
                 This method is called when a compare request comes from a
                 client.  Its arguments are as follows.
                   * object reference
                   * dn
                   * attribute assertion string

          modify This method is called when a modify request comes from a
                 client.  Its arguments are as follows.
                   * object reference
                   * dn
                   * a list formatted as follows
                     ({ "ADD" | "DELETE" | "REPLACE" },
                      attributetype, value...)...

          add    This method is called when a add request comes from a
                 client.  Its arguments are as follows.
                   * object reference
                   * entry in string format

          modrdn This method is called when a modrdn request comes from a
                 client.  Its arguments are as follows.
                   * object reference
                   * dn
                   * new rdn
                   * delete old dn flag (1 means yes)

          delete This method is called when a delete request comes from a
                 client.  Its arguments are as follows.
                   * object reference
                   * dn

          config This method is called once for each perlModuleConfig line
                 in the slapd.conf(5) configuration file.  Its arguments
                 are as follows.
                   * object reference
                   * array of arguments on line

          Return value: nonzero if this is not a valid option.

          init   This method is called after backend is initialized.  Its
                 argument is as follows.
                   * object reference

          Return value: nonzero if initialization failed.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the PERL backend database.
          That is, they must follow a "database perl" line and come before
          any subsequent "backend" or "database" lines.  Other database
          options are described in the slapd.conf(5) manual page.

          perlModulePath /path/to/libs
                 Add the path to the @INC variable.

          perlModule ModName
                 `Use' the module name ModName from ModName.pm

          filterSearchResults
                 Search results are candidates that need to be filtered
                 (with the filter in the search request), rather than
                 search results to be returned directly to the client.

          perlModuleConfig <arguments>
                 Invoke the module's config method with the given
                 arguments.


-------------------------------------------------------

::

          There is an example Perl module `SampleLDAP' in the
          slapd/back-perl/ directory in the OpenLDAP source tree.


---------------------------------------------------------------------

::

          The perl backend does not honor any of the access control
          semantics described in slapd.access(5); all access control is
          delegated to the underlying PERL scripting.  Only read (=r)
          access to the entry pseudo-attribute and to the other attribute
          values of the entries returned by the search operation is
          honored, which is performed by the frontend.


-------------------------------------------------------

::

          The interface of this backend to the perl module MAY change.  Any
          suggestions would greatly be appreciated.

          Note: in previous versions, any unrecognized lines in the
          slapd.conf file were passed to the perl module's config method.
          This behavior is deprecated (but still allowed for backward
          compatibility), and the perlModuleConfig directive should instead
          be used to invoke the module's config method. This compatibility
          feature will be removed at some future date.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd(8), perl(1).

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

   OpenLDAP LDVERSION             RELEASEDATE                 SLAPD-PERL(5)

--------------

Pages that refer to this page:
`slapd.backends(5) <../man5/slapd.backends.5.html>`__

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
