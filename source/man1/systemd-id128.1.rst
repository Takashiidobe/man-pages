.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-id128(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-ID128(1)              systemd-id128             SYSTEMD-ID128(1)

NAME
-------------------------------------------------

::

          systemd-id128 - Generate and print sd-128 identifiers


---------------------------------------------------------

::

          systemd-id128 [OPTIONS...] new

          systemd-id128 [OPTIONS...] machine-id

          systemd-id128 [OPTIONS...] boot-id

          systemd-id128 [OPTIONS...] invocation-id


---------------------------------------------------------------

::

          id128 may be used to conveniently print sd-id128(3) UUIDs. What
          identifier is printed depends on the specific verb.

          With new, a new random identifier will be generated.

          With machine-id, the identifier of the current machine will be
          printed. See machine-id(5).

          With boot-id, the identifier of the current boot will be printed.

          Both machine-id and boot-id may be combined with the
          --app-specific=app-id switch to generate application-specific
          IDs. See sd_id128_get_machine(3) for the discussion when this is
          useful.

          With invocation-id, the identifier of the current service
          invocation will be printed. This is available in systemd
          services. See systemd.exec(5).

          With show, well-known UUIDs are printed. When no arguments are
          specified, all known UUIDs are shown. When arguments are
          specified, they must be the names or values of one or more known
          UUIDs, which are then printed.


-------------------------------------------------------

::

          The following options are understood:

          -p, --pretty
              Generate output as programming language snippets.

          -a app-id, --app-specific=app-id
              With this option, an identifier that is the result of hashing
              the application identifier app-id and the machine identifier
              will be printed. The app-id argument must be a valid sd-id128
              string identifying the application.

          -u, --uuid
              Generate output as an UUID formatted in the "canonical
              representation", with five groups of digits separated by
              hyphens. See the wikipedia[1] for more discussion.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), sd-id128(3), sd_id128_get_machine(3)


---------------------------------------------------

::

           1. wikipedia
              https://en.wikipedia.org/wiki/Universally_unique_identifier#Format

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                             SYSTEMD-ID128(1)

--------------

Pages that refer to this page:
`sd-id128(3) <../man3/sd-id128.3.html>`__, 
`sd_id128_get_machine(3) <../man3/sd_id128_get_machine.3.html>`__, 
`sd_id128_randomize(3) <../man3/sd_id128_randomize.3.html>`__

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
