.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

matchpathcon_checkmatches(3) — Linux manual page
================================================

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

   matchpathcon_checkmatches(3)nux API documentationpathcon_checkmatches(3)

NAME
-------------------------------------------------

::

          matchpathcon_checkmatches, matchpathcon_filespec_add,
          matchpathcon_filespec_destroy, matchpathcon_filespec_eval - check
          and report whether any specification index has no matches with
          any inode. Maintenance and statistics on inode associations


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          void matchpathcon_checkmatches(char *str);

          int matchpathcon_filespec_add(ino_t ino, int specind, const char
          *file);

          void matchpathcon_filespec_destroy(void);

          void matchpathcon_filespec_eval(void);


---------------------------------------------------------------

::

          matchpathcon_checkmatches() checks whether any specification has
          no matches and reports them.  The str argument is used as a
          prefix for any warning messages.

          matchpathcon_filespec_add() maintains an association between an
          inode ino and a specification index specind, and checks whether a
          conflicting specification is already associated with the same
          inode (e.g. due to multiple hard links). If so, then it uses the
          latter of the two specifications based on their order in the file
          context configuration. Returns the specification index used or -1
          on error.

          matchpathcon_filespec_destroy() destroys any inode associations
          that have been added, e.g. to restart for a new filesystem.

          matchpathcon_filespec_eval() displays statistics on the hash
          table usage for the inode associations.


-----------------------------------------------------------------

::

          Returns zero on success or -1 otherwise.


---------------------------------------------------------

::

          selinux(8), matchpathcon(3), matchpathcon_index(3), freecon(3),
          setfilecon(3), setfscreatecon(3)

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

   sds@tycho.nsa.gov           21 November 2009matchpathcon_checkmatches(3)

--------------

Pages that refer to this page:
`matchpathcon(3) <../man3/matchpathcon.3.html>`__

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
