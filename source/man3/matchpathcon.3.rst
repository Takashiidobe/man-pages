.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

matchpathcon(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   matchpathcon(3)         SELinux API documentation        matchpathcon(3)

NAME
-------------------------------------------------

::

          matchpathcon, matchpathcon_index - get the default SELinux
          security context for the specified path from the file contexts
          configuration


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int matchpathcon_init(const char *path);

          int matchpathcon_init_prefix(const char *path, const char
          *prefix);

          int matchpathcon_fini(void);

          int matchpathcon(const char *path, mode_t mode, char **con);

          int matchpathcon_index(const char *name, mode_t mode, char
          **con);


---------------------------------------------------------------

::

          This family of functions is deprecated.  For new code, please use
          selabel_open(3) with the SELABEL_CTX_FILE backend in place of
          matchpathcon_init(), use selabel_close(3) in place of
          matchpathcon_fini(), and use selabel_lookup(3) in place of
          matchpathcon().

          The remaining description below is for the legacy interface.

          matchpathcon_init() loads the file contexts configuration
          specified by path into memory for use by subsequent
          matchpathcon() calls.  If path is NULL, then the active file
          contexts configuration is loaded by default, i.e. the path
          returned by selinux_file_context_path(3).  Unless the
          MATCHPATHCON_BASEONLY flag has been set via
          set_matchpathcon_flags(3), files with the same path prefix but a
          .homedirs and .local suffix are also looked up and loaded if
          present.  These files provide dynamically generated entries for
          user home directories and for local customizations.

          matchpathcon_init_prefix() is the same as matchpathcon_init() but
          only loads entries with regular expressions whose first pathname
          component is a prefix of prefix , e.g. pass "/dev" if you only
          intend to call matchpathcon() with pathnames beginning with /dev.
          However, this optimization is no longer necessary due to the use
          of file_contexts.bin files with precompiled regular expressions,
          so use of this interface is deprecated.

          matchpathcon_fini() frees the memory allocated by a prior call to
          matchpathcon_init.() This function can be used to free and reset
          the internal state between multiple matchpathcon_init() calls, or
          to free memory when finished using matchpathcon().

          matchpathcon() matches the specified pathname, after
          transformation via realpath(3) excepting any final symbolic link
          component if S_IFLNK was specified as the mode, and mode against
          the file contexts configuration and sets the security context con
          to refer to the resulting context. The caller must free the
          returned security context con using freecon(3) when finished
          using it.  mode can be 0 to disable mode matching, but should be
          provided whenever possible, as it may affect the matching.  Only
          the file format bits (i.e. the file type) of the mode are used.
          If matchpathcon_init() has not already been called, then this
          function will call it upon its first invocation with a NULL path,
          defaulting to the active file contexts configuration.

          matchpathcon_index() is the same as matchpathcon() but returns a
          specification index that can later be used in a
          matchpathcon_filespec_add(3) call.


-----------------------------------------------------------------

::

          Returns zero on success or -1 otherwise.


---------------------------------------------------------

::

          selinux(8), set_matchpathcon_flags(3),
          set_matchpathcon_invalidcon(3), set_matchpathcon_printf(3),
          matchpathcon_filespec_add(3), matchpathcon_checkmatches(3),
          freecon(3), setfilecon(3), setfscreatecon(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   sds@tycho.nsa.gov           21 November 2009             matchpathcon(3)

--------------

Pages that refer to this page:
`matchpathcon_checkmatches(3) <../man3/matchpathcon_checkmatches.3.html>`__, 
`selinux_lsetfilecon_default(3) <../man3/selinux_lsetfilecon_default.3.html>`__, 
`set_matchpathcon_flags(3) <../man3/set_matchpathcon_flags.3.html>`__, 
`matchpathcon(8) <../man8/matchpathcon.8.html>`__

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
