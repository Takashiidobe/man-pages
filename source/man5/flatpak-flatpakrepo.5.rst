.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-flatpakrepo(5) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAKREPO(5)                 flatpakrepo                FLATPAKREPO(5)

NAME
-------------------------------------------------

::

          flatpak-flatpakrepo - Reference to a remote


---------------------------------------------------------------

::

          Flatpak uses flatpakrepo files to share information about
          remotes. The flatpakrepo file contains enough information to add
          the remote. Use the flatpak remote-add --from command to do so.

          flatpakrepo files may also contain additional information that is
          useful when displaying a remote to the user, e.g. in an app
          store.

          The filename extension commonly used for flatpakrepo files is
          .flatpakrepo.


---------------------------------------------------------------

::

          The flatpakrepo file is using the same .ini file format that is
          used for systemd unit files or application .desktop files.

      [Flatpak Repo]
          All the information is contained in the [Flatpak Repo] group.

          The following keys can be present in this group:

          Version (uint64)
              The version of the file format, must be 1 if present.

          Url (string)
              The url for the remote. This key is mandatory.

          GPGKey (string)
              The base64-encoded gpg key for the remote.

          DefaultBranch (string)
              The default branch to use for this remote.

          Subset (string)
              Limit the remote to the named subset of refs.

          Title (string)
              The title of the remote. This should be a user-friendly name
              that can be displayed e.g. in an app store.

          Comment (string)
              A short summary of the remote, for display e.g. in an app
              store.

          Description (string)
              A longer description of the remote, for display e.g. in an
              app store..

          Icon (string)
              The url for an icon that can be used to represent the remote.

          Homepage (string)
              The url of a webpage describing the remote.

          Filter (string)
              The path of a local file to use to filter remote refs. See
              flatpak-remote-add(1) for details on the format of the file.

              Note: This field is treated a bit special by flatpak
              remote-add. If you install a remote with --if-not-exists then
              and the remote is already configured, then the filter field
              of the remote configuration will be update anyway. And, if
              the filter field is *not* specified then any existing filters
              are cleared. The goal here is to allow a pre-configured
              filtered remote to be replaced with the regular one if you
              add the normal upstream (unfiltered) flatpakrepo file.

          DeployCollectionID (string)
              The collection ID of the remote, if it has one. This uniquely
              identifies the collection of apps in the remote, to allow
              peer to peer redistribution. It is recommended to use this
              key over CollectionID because only newer clients pay
              attention to it (and older clients don't handle collection
              IDs properly).

          CollectionID (string)
              This is deprecated but still supported for backwards
              compatibility. Use DeployCollectionID instead.


-------------------------------------------------------

::

              [Flatpak Repo]
              Title=gedit
              Url=http://sdk.gnome.org/repo-apps/
              GPGKey=mQENBFUUCGcBCAC/K9WeV4xCaKr3NKRqPXeY5mpaXAJyasLqCtrDx92WUgbu0voWrhohNAKpqizod2dvzc/XTxm3rHyIxmNfdhz1gaGhynU75Qw4aJVcly2eghTIl++gfDtOvrOZo/VuAq30f32dMIgHQdRwEpgCwz7WyjpqZYltPAEcCNL4MTChAfiHJeeiQ5ibystNBW8W6Ymf7sO4m4g5+/aOxI54oCOzD9TwBAe+yXcJJWtc2rAhMCjtyPJzxd0ZVXqIzCe1xRvJ6Rq7YCiMbiM2DQFWXKnmYQbj4TGNMnwNdAajCdrcBWEMSbzq7EzuThIJRd8Ky4BkEe1St6tuqwFaMZz+F9eXABEBAAG0KEdub21lIFNESyAzLjE2IDxnbm9tZS1vcy1saXN0QGdub21lLm9yZz6JATgEEwECACIFAlUUCGcCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEArkz6VV0VKBa5cH/0vXa31YgEjNk78gGFXqnQxdD1WYA87OYxDi189l4lA802EFTF4wCBuZyDOqdd5BhS3Ab0cR778DmZXRUP2gwe+1zTJypU2JMnDpkwJ4NK1VP6/tE4SAPrznBtmb76BKaWBqUfZ9Wq1zg3ugvqkZB/Exq+usypIOwQVp1KL58TrjBRda0HvRctzkNhr0qYAtkfLFe0GvksBp4vBm8uGwAx7fw/HbhIjQ9pekTwvB+5GwDPO/tSip/1bQfCS+XJB8Ffa04HYPLGedalnWBrwhYY+G/kn5Zh9L/AC8xeLwTJTHM212rBjPa9CWs9C6a57MSaeGIEHLC1hEyiJJ15w8jmY=
              DeployCollectionID=org.gnome.Apps


---------------------------------------------------------

::

          flatpak(1), flatpak-remote-add(1), flatpak-flatpakref(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the flatpak (a tool for building and
          distributing desktop applications on Linux) project.  Information
          about the project can be found at ⟨http://flatpak.org/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/flatpak/flatpak⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   flatpak                                                   FLATPAKREPO(5)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-remote-add(1) <../man1/flatpak-remote-add.1.html>`__, 
`flatpak-flatpakref(5) <../man5/flatpak-flatpakref.5.html>`__

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
