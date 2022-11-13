.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

security_load_booleans(3) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   security_get_boolean_names(3)ux API Documentationty_get_boolean_names(3)

NAME
-------------------------------------------------

::

          security_set_boolean, security_commit_booleans,
          security_get_boolean_names, security_get_boolean_active,
          security_get_boolean_pending - routines for manipulating SELinux
          boolean values


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int security_get_boolean_names(char ***names, int *len);

          int security_get_boolean_pending(const char *name);

          int security_get_boolean_active(const char *name);

          int security_set_boolean(const char *name, int value);

          int security_set_boolean_list(size_t boolcnt, SELboolean
          *boollist, int permanent);

          int security_commit_booleans(void);


---------------------------------------------------------------

::

          The SELinux policy can include conditional rules that are enabled
          or disabled based on the current values of a set of policy
          booleans.  These policy booleans allow runtime modification of
          the security policy without having to load a new policy.

          The SELinux API allows for a transaction based update. So you can
          set several boolean values and then commit them all at once.

          security_get_boolean_names() provides a list of boolean names,
          currently supported by the loaded policy.

          security_get_boolean_pending() returns the pending value for
          boolean or -1 on failure.

          security_get_boolean_active() returns the active value for
          boolean or -1 on failure.

          security_set_boolean() sets the pending value for boolean

          security_set_boolean_list() saves a list of booleans in a single
          transaction. Note that the int permanent flag is deprecated and
          should be set to zero.

          security_commit_booleans() commits all pending values for the
          booleans.


-----------------------------------------------------------------

::

          Where not otherwise stated, functions described in this manual
          page return zero on success or -1 on error.


-----------------------------------------------------

::

          This manual page was written by Dan Walsh <dwalsh@redhat.com>.


---------------------------------------------------------

::

          selinux(8), getsebool(8), booleans(8), togglesebool(8)

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

   dwalsh@redhat.com           15 November 2004security_get_boolean_names(3)

--------------

Pages that refer to this page:
`selinux_boolean_sub(3) <../man3/selinux_boolean_sub.3.html>`__

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
