.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selabel_open(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GL                               |                                   |
| OBAL OPTIONS <#GLOBAL_OPTIONS>`__ |                                   |
| \| `BACKENDS <#BACKENDS>`__ \|    |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selabel_open(3)         SELinux API documentation        selabel_open(3)

NAME
-------------------------------------------------

::

          selabel_open, selabel_close - userspace SELinux labeling
          interface


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/label.h>

          struct selabel_handle *selabel_open(int backend,
                                              const struct selinux_opt
                                              *options,
                                              unsigned nopt);

          void selabel_close(struct selabel_handle *hnd);


---------------------------------------------------------------

::

          selabel_open() is used to initialize a labeling handle to be used
          for lookup operations.  The backend argument specifies which
          backend is to be opened; the list of current backends appears in
          BACKENDS below.

          The options argument should be NULL or a pointer to an array of
          selinux_opt structures of length nopt:

                 struct selinux_opt {
                     int         type;
                     const char  *value;
                 };

          The available option types are described in GLOBAL OPTIONS below
          as well as in the documentation for each individual backend.  The
          return value on success is a non-NULL value for use in subsequent
          label operations.

          selabel_close() terminates use of a handle, freeing any internal
          resources associated with it.  After this call has been made, the
          handle must not be used again.


---------------------------------------------------------------------

::

          Global options which may be passed to selabel_open() include the
          following:

          SELABEL_OPT_UNUSED
                 The option with a type code of zero is a no-op.  Thus an
                 array of options may be initizalized to zero and any
                 untouched elements will not cause an error.

          SELABEL_OPT_VALIDATE
                 A non-null value for this option enables context
                 validation.  By default, security_check_context(3) is
                 used; a custom validation function can be provided via
                 selinux_set_callback(3).  Note that an invalid context may
                 not be treated as an error unless it is actually
                 encountered during a lookup operation.

          SELABEL_OPT_DIGEST
                 A non-null value for this option enables the generation of
                 an SHA1 digest of the spec files loaded as described in
                 selabel_digest(3)


---------------------------------------------------------

::

          SELABEL_CTX_FILE
                 File contexts backend, described in selabel_file(5).

          SELABEL_CTX_MEDIA
                 Media contexts backend, described in selabel_media(5).

          SELABEL_CTX_X
                 X Windows contexts backend, described in selabel_x(5).

          SELABEL_CTX_DB
                 Database objects contexts backend, described in
                 selabel_db(5).


-----------------------------------------------------------------

::

          A non-NULL handle value is returned on success.  On error, NULL
          is returned and errno is set appropriately.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          selabel_lookup(3), selabel_stats(3), selinux_set_callback(3),
          selinux(8)

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

                                  18 Jun 2007               selabel_open(3)

--------------

Pages that refer to this page:
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`selabel_digest(3) <../man3/selabel_digest.3.html>`__, 
`selabel_get_digests_all_partial_matches(3) <../man3/selabel_get_digests_all_partial_matches.3.html>`__, 
`selabel_lookup(3) <../man3/selabel_lookup.3.html>`__, 
`selabel_lookup_best_match(3) <../man3/selabel_lookup_best_match.3.html>`__, 
`selabel_partial_match(3) <../man3/selabel_partial_match.3.html>`__, 
`selabel_stats(3) <../man3/selabel_stats.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_default_handle(3) <../man3/selinux_restorecon_default_handle.3.html>`__, 
`selinux_restorecon_set_sehandle(3) <../man3/selinux_restorecon_set_sehandle.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__, 
`selinux_set_callback(3) <../man3/selinux_set_callback.3.html>`__, 
`selabel_db(5) <../man5/selabel_db.5.html>`__, 
`selabel_file(5) <../man5/selabel_file.5.html>`__, 
`selabel_media(5) <../man5/selabel_media.5.html>`__, 
`selabel_x(5) <../man5/selabel_x.5.html>`__

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
