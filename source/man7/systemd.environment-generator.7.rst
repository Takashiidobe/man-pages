.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.environment-generator(7) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.ENVIRONMENT-GENERATOR(7)vironment-generatorIRONMENT-GENERATOR(7)

NAME
-------------------------------------------------

::

          systemd.environment-generator - systemd environment file
          generators


---------------------------------------------------------

::

          /usr/lib/systemd/system-environment-generators/some-generator

          /usr/lib/systemd/user-environment-generators/some-generator

          /run/systemd/system-environment-generators/*
          /etc/systemd/system-environment-generators/*
          /usr/local/lib/systemd/system-environment-generators/*
          /usr/lib/systemd/system-environment-generators/*

          /run/systemd/user-environment-generators/*
          /etc/systemd/user-environment-generators/*
          /usr/local/lib/systemd/user-environment-generators/*
          /usr/lib/systemd/user-environment-generators/*


---------------------------------------------------------------

::

          Generators are small executables that live in
          /usr/lib/systemd/system-environment-generators/ and other
          directories listed above.  systemd(1) will execute those binaries
          very early at the startup of each manager and at configuration
          reload time, before running the generators described in
          systemd.generator(7) and before starting any units. Environment
          generators can override the environment that the manager exports
          to services and other processes.

          Generators are loaded from a set of paths determined during
          compilation, as listed above. System and user environment
          generators are loaded from directories with names ending in
          system-environment-generators/ and user-environment-generators/,
          respectively. Generators found in directories listed earlier
          override the ones with the same name in directories lower in the
          list. A symlink to /dev/null or an empty file can be used to mask
          a generator, thereby preventing it from running. Please note that
          the order of the two directories with the highest priority is
          reversed with respect to the unit load path, and generators in
          /run/ overwrite those in /etc/.

          After installing new generators or updating the configuration,
          systemctl daemon-reload may be executed. This will re-run all
          generators, updating environment configuration. It will be used
          for any services that are started subsequently.

          Environment file generators are executed similarly to unit file
          generators described in systemd.generator(7), with the following
          differences:

          •   Generators are executed sequentially in the alphanumerical
              order of the final component of their name. The output of
              each generator output is immediately parsed and used to
              update the environment for generators that run after that.
              Thus, later generators can use and/or modify the output of
              earlier generators.

          •   Generators are run by every manager instance, their output
              can be different for each user.

          It is recommended to use numerical prefixes for generator names
          to simplify ordering.


---------------------------------------------------------

::

          Example 1. A simple generator that extends an environment
          variable if a directory exists in the file system

              # 50-xdg-data-dirs.sh

              #!/bin/bash

              # set the default value
              XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share}"

              # add a directory if it exists
              if [[ -d /opt/foo/share ]]; then
                  XDG_DATA_DIRS="/opt/foo/share:${XDG_DATA_DIRS}"
              fi

              # write our output
              echo "XDG_DATA_DIRS=${XDG_DATA_DIRS}"

          Example 2. A more complicated generator which reads existing
          configuration and mutates one variable

              # 90-rearrange-path.py

              #!/usr/bin/env python3

              """

              Proof-of-concept systemd environment generator that makes sure that bin dirs
              are always after matching sbin dirs in the path.
              (Changes /sbin:/bin:/foo/bar to /bin:/sbin:/foo/bar.)

              This generator shows how to override the configuration possibly created by
              earlier generators. It would be easier to write in bash, but let's have it
              in Python just to prove that we can, and to serve as a template for more
              interesting generators.

              """

              import os
              import pathlib

              def rearrange_bin_sbin(path):
                  """Make sure any pair of .../bin, .../sbin directories is in this order

                  >>> rearrange_bin_sbin('/bin:/sbin:/usr/sbin:/usr/bin')
                  '/bin:/sbin:/usr/bin:/usr/sbin'
                  """
                  items = [pathlib.Path(p) for p in path.split(':')]
                  for i in range(len(items)):
                      if 'sbin' in items[i].parts:
                          ind = items[i].parts.index('sbin')
                          bin = pathlib.Path(*items[i].parts[:ind], 'bin', *items[i].parts[ind+1:])
                          if bin in items[i+1:]:
                              j = i + 1 + items[i+1:].index(bin)
                              items[i], items[j] = items[j], items[i]
                  return ':'.join(p.as_posix() for p in items)

              if __name__ == '__main__':
                  path = os.environ['PATH'] # This should be always set.
                                            # If it's not, we'll just crash, which is OK too.
                  new = rearrange_bin_sbin(path)
                  if new != path:
                      print('PATH={}'.format(new))

          Example 3. Debugging a generator

              SYSTEMD_LOG_LEVEL=debug VAR_A=something VAR_B="something else" \
              /usr/lib/systemd/system-environment-generators/path-to-generator


---------------------------------------------------------

::

          systemd-environment-d-generator(8), systemd.generator(7),
          systemd(1), systemctl(1)

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

   systemd 249                             SYSTEMD.ENVIRONMENT-GENERATOR(7)

--------------

Pages that refer to this page:
`environment.d(5) <../man5/environment.d.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`systemd.generator(7) <../man7/systemd.generator.7.html>`__, 
`systemd-environment-d-generator(8) <../man8/systemd-environment-d-generator.8.html>`__

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
