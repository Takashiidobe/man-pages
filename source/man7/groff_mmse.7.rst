.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_mmse(7) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `Namn <#Namn>`__ \|               |                                   |
| `Syntax <#Syntax>`__ \|           |                                   |
| `Beskrivning <#Beskrivning>`__ \| |                                   |
| `Brev <#Brev>`__ \|               |                                   |
| `Skrivet av <#Skrivet_av>`__ \|   |                                   |
| `Filer <#Filer>`__ \|             |                                   |
| `Se ocks� <#Se_ocks�>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_mmse(7)       Miscellaneous Information Manual       groff_mmse(7)


-------------------------------------------------

::

          groff_mmse - svenska ”memorandum” makro för GNU roff


-----------------------------------------------------

::

          groff -mmse [flaggor ...] [filer ...]
          groff -m mmse [flaggor ...] [filer ...]


---------------------------------------------------------------

::

          mmse �r en svensk variant av mm. Alla texter �r �versatta. En A4
          sida f�r text som �r 13 cm bred, 3,5 cm indragning samt �r
          28,5 cm h�g. Det finns st�d f�r brevuppst�llning enligt svensk
          standard f�r v�nster och h�gerjusterad text.

          COVER kan anv�nda se_ms som argument. Detta ger ett svenskt
          f�rs�ttsblad. Se groff_mm(7) f�r �vriga detaljer.


-------------------------------------------------

::

          Tillg�ngliga brevtyper:

          .LT SVV
                 V�nsterst�lld l�ptext med adressat i position T0
                 (v�nsterst�llt).

          .LT SVH
                 H�gerst�lld l�ptext med adressat i position T4 (passar
                 f�nsterkuvert).

          F�ljande extra LO-variabler anv�nds.

          .LO DNAMN namn
                 Anger dokumentets namn.

          .LO MDAT datum
                 Mottagarens datum, anges under Ert datum: (LetMDAT).

          .LO BIL str�ng
                 Anger bilaga, nummer eller str�ng med Bilaga (LetBIL) som
                 prefix.

          .LO KOMP text
                 Anger kompletteringsuppgift.

          .LO DBET beteckning
                 Anger dokumentbeteckning eller dokumentnummer.

          .LO BET beteckning
                 Anger beteckning (�rendebeteckning i form av diarienummer
                 eller liknande).

          .LO SIDOR antal
                 Anger totala antalet sidor och skrivs ut efter sidnumret
                 inom parenteser.

          Om makrot .TP �r definierat anropas det efter utskrift av
          brevhuvudet. D�r l�gger man l�mpligen in postadress och annat som
          brevfot.


-------------------------------------------------------------

::

          J�rgen H�gg, Lund, Sweden <Jorgen.Hagg@axis.se>


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/mse.tmac

          /usr/local/share/groff/1.23.0/tmac/mm/se_*.cov


---------------------------------------------------------

::

          groff(1), troff(1), tbl(1), pic(1), eqn(1), groff_mm(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project. Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩. If you have a bug report for
          this manual page, see ⟨http://www.gnu.org/software/groff/⟩. This
          page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27. (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.) If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                groff_mmse(7)

--------------

Pages that refer to this page: `mmroff(1) <../man1/mmroff.1.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`groff_mm(7) <../man7/groff_mm.7.html>`__

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
