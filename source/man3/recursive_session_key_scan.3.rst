.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

recursive_key_scan(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `LINKING <#LINKING>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RECURSIVE_KEY_SCAN(3)    Linux Key Utility Calls   RECURSIVE_KEY_SCAN(3)

NAME
-------------------------------------------------

::

          recursive_key_scan, recursive_session_key_scan - apply a function
          to all keys in a keyring tree


---------------------------------------------------------

::

          #include <keyutils.h>

          typedef int (*recursive_key_scanner_t)(key_serial_t parent,
              key_serial_t key, char *desc, int desc_len, void *data);

          long recursive_key_scan(key_serial_t keyring,
              recursive_key_scanner_t func, void *data);
          long recursive_session_key_scan(recursive_key_scanner_t func,
              void *data);


---------------------------------------------------------------

::

          recursive_key_scan() performs a depth-first recursive scan of the
          specified keyring tree and applies func to every link found in
          the accessible keyrings in that tree.  data is passed to each
          invocation of func.

          The return values of func are summed and returned as the overall
          return value.  Errors are ignored.  Inaccessible keyrings are not
          scanned, but links to them are still passed to func.

          recursive_session_key_scan() works exactly like
          recursive_key_scan() with the caller's session keyring specified
          as the starting keyring.

          The callback function is called for each link found in all the
          keyrings in the nominated tree and so may be called multiple
          times for a particular key if that key has multiple links to it.

          The callback function is passed the following parameters:

          parent The keyring containing the link or 0 for the initial key.

          key    The key to which the link points.

          desc and desc_len
                 A pointer to the raw description and its length as
                 retrieved with keyctl_describe_alloc().  These will be
                 NULL and -1 respectively if the description couldn't be
                 retrieved and errno will retain the error from
                 keyctl_describe_alloc().

          data   The data passed to the scanner function.


-----------------------------------------------------------------

::

          These functions return the sum of the results of the callback
          functions they invoke.


-----------------------------------------------------

::

          Ignored.


-------------------------------------------------------

::

          When linking, -lkeyutils should be specified to the linker.


---------------------------------------------------------

::

          keyctl(3), keyctl_describe_alloc(3), keyrings(7)

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

   Linux                          10 Mar 2011         RECURSIVE_KEY_SCAN(3)

--------------

Pages that refer to this page: `keyctl(2) <../man2/keyctl.2.html>`__, 
`keyctl(3) <../man3/keyctl.3.html>`__

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
