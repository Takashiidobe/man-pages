.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_context_to_sid(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   avc_context_to_sid(3)   SELinux API documentation  avc_context_to_sid(3)

NAME
-------------------------------------------------

::

          avc_context_to_sid, avc_sid_to_context, avc_get_initial_sid -
          obtain and manipulate SELinux security ID's


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          int avc_context_to_sid(char *ctx, security_id_t *sid);

          int avc_sid_to_context(security_id_t sid, char **ctx);

          int avc_get_initial_sid(const char *name, security_id_t *sid);


---------------------------------------------------------------

::

          Security ID's (SID's) are opaque representations of security
          contexts, managed by the userspace AVC.

          avc_context_to_sid() returns a SID for the given context in the
          memory referenced by sid.

          avc_sid_to_context() returns a copy of the context represented by
          sid in the memory referenced by ctx.  The user must free the copy
          with freecon(3).

          avc_get_initial_sid() returns a SID for the kernel initial
          security identifier specified by name.


-----------------------------------------------------------------

::

          avc_context_to_sid() and avc_sid_to_context() return zero on
          success.  On error, -1 is returned and errno is set
          appropriately.


-----------------------------------------------------

::

          ENOMEM An attempt to allocate memory failed.


---------------------------------------------------

::

          As of libselinux version 2.0.86, SID's are no longer reference
          counted.  A SID will be valid from the time it is first obtained
          until the next call to avc_destroy(3).  The sidget(3) and
          sidput(3) functions, formerly used to adjust the reference count,
          are no-ops and are deprecated.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          avc_init(3), avc_has_perm(3), avc_cache_stats(3),
          avc_add_callback(3), getcon(3), freecon(3), selinux(8)

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

                                  27 May 2004         avc_context_to_sid(3)

--------------

Pages that refer to this page:
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_cache_stats(3) <../man3/avc_cache_stats.3.html>`__, 
`avc_compute_create(3) <../man3/avc_compute_create.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__

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
