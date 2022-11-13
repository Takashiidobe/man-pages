.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bpfc(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SYNTAX <#SYNTAX>`__ \|           |                                   |
| `SOUR                             |                                   |
| CE EXAMPLES <#SOURCE_EXAMPLES>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| USAGE EXAMPLE <#USAGE_EXAMPLE>`__ |                                   |
| \| `LEGAL <#LEGAL>`__ \|          |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BPFC(8)                    netsniff-ng toolkit                   BPFC(8)

NAME
-------------------------------------------------

::

          bpfc - a Berkeley Packet Filter assembler and compiler


---------------------------------------------------------

::

          bpfc { [options] | [source-file] }


---------------------------------------------------------------

::

          bpfc is a small Berkeley Packet Filter assembler and compiler
          which is able to translate BPF assembler-like mnemonics into a
          numerical or C-like format, that can be read by tools such as
          netsniff-ng, iptables (xt_bpf) and many others. BPF is the one
          and only upstream filtering construct that is used in combination
          with packet(7) sockets, but also seccomp-BPF for system call
          sandboxing.

          The Linux kernel and also BSD kernels implement "virtual machine"
          like constructs and JIT compilers that mimic a small register-
          based machine in BPF architecture and execute filter code that
          is, for example, composed by bpfc on a data buffer that is given
          by network packets. The purpose of this is to shift computation
          in time, so that the kernel can drop or truncate incoming packets
          as early as possible without having to push them to user space
          for further analysis first. Meanwhile, BPF constructs also find
          application in other areas such as in the communication between
          user and kernel space like system call sand-boxing.

          At the time of writing this man page, the only other available
          BPF compiler is part of the pcap(3) library and accessible
          through a high-level filter language that might be familiar to
          many people as tcpdump-like filters.

          However, it is quite often useful to bypass that compiler and
          write optimized code that cannot be produced by the pcap(3)
          compiler, or is wrongly optimized, or is defective on purpose in
          order to debug test kernel code. Also, a reason to use bpfc could
          be to try out some new BPF extensions that are not supported by
          other compilers. Furthermore, bpfc can be useful to verify JIT
          compiler behavior or to find possible bugs that need to be fixed.

          bpfc is implemented with the help of flex(1) and bison(1),
          tokenizes the source file in the first stage and parses its
          content into an AST.  In two code generation stages it emits
          target opcodes. bpfc furthermore supports Linux kernel BPF
          extensions. More about that can be found in the syntax section.

          The Linux kernel BPF JIT compiler is automatically turned on if
          detected by netsniff-ng. However, it can also be manually turned
          on through the command ''echo "1" >
          /proc/sys/net/core/bpf_jit_enable'' (normal working mode) or
          ''echo "2" > /proc/sys/net/core/bpf_jit_enable'' (debug mode
          where emitted opcodes of the image are printed to the kernel
          log). An architecture agnostic BPF JIT image disassembler can be
          found in the kernel source tree under
          ''tools/net/bpf_jit_disasm.c'' or within the netsniff-ng Git
          repository.


-------------------------------------------------------

::

          -i <source-file/->, --input <source-file/->
                 Read BPF assembly instruction from an input file or from
                 stdin.

          -p, --cpp
                 Pass the bpf program through the C preprocessor before
                 reading it in bpfc. This allows #define and #include
                 directives (e.g. to include definitions from system
                 headers) to be used in the bpf program.

          -D <name>=<definition>, --define <name>=<definition>
                 Add macro definition for the C preprocessor to use it
                 within bpf file. This option is used in combination with
                 the -p/--cpp option.

          -f <format>, --format <format>
                 Specify a different output format than the default that is
                 netsniff-ng compatible. The <format> specifier can be: C,
                 netsniff-ng, xt_bpf, tcpdump.

          -b, --bypass
                 Bypass basic filter validation when emitting opcodes. This
                 can be useful for explicitly creating malformed BPF
                 expressions for injecting into the kernel, for example,
                 for bug testing.

          -V, --verbose
                 Be more verbose and display some bpfc debugging
                 information.

          -d, --dump
                 Dump all supported instructions to stdout.

          -v, --version
                 Show version information and exit.

          -h, --help
                 Show user help and exit.


-----------------------------------------------------

::

          The BPF architecture resp. register machine consists of the
          following elements:

              Element          Description

              A                32 bit wide accumulator
              X                32 bit wide X register
              M[]              16 x 32 bit wide misc registers aka “scratch
          memory store”, addressable from 0 to 15

          A program, that is translated by bpfc into ''opcodes'' is an
          array that consists of the following elements:

              o:16, jt:8, jf:8, k:32

          The element o is a 16 bit wide opcode that has a particular
          instruction encoded, jt and jf are two 8 bit wide jump targets,
          one for condition
           ''true'', one for condition ''false''. Last but not least the 32
          bit wide element k contains a miscellaneous argument that can be
          interpreted in different ways depending on the given instruction
          resp. opcode.

          The instruction set consists of load, store, branch, alu,
          miscellaneous and return instructions that are also represented
          in bpfc syntax. This table also includes bpfc's own extensions.
          All operations are based on unsigned data structures:

             Instruction      Addressing mode      Description

             ld               1, 2, 3, 4, 10       Load word into A
             ldi              4                    Load word into A
             ldh              1, 2                 Load half-word into A
             ldb              1, 2                 Load byte into A
             ldx              3, 4, 5, 10          Load word into X
             ldxi             4                    Load word into X
             ldxb             5                    Load byte into X

             st               3                    Copy A into M[]
             stx              3                    Copy X into M[]

             jmp              6                    Jump to label
             ja               6                    Jump to label
             jeq              7, 8                 Jump on k == A
             jneq             8                    Jump on k != A
             jne              8                    Jump on k != A
             jlt              8                    Jump on k < A
             jle              8                    Jump on k <= A
             jgt              7, 8                 Jump on k > A
             jge              7, 8                 Jump on k >= A
             jset             7, 8                 Jump on k & A

             add              0, 4                 A + <x>
             sub              0, 4                 A - <x>
             mul              0, 4                 A * <x>
             div              0, 4                 A / <x>
             mod              0, 4                 A % <x>
             neg              0, 4                 !A
             and              0, 4                 A & <x>
             or               0, 4                 A | <x>
             xor              0, 4                 A ^ <x>
             lsh              0, 4                 A << <x>
             rsh              0, 4                 A >> <x>

             tax                                   Copy A into X
             txa                                   Copy X into A

             ret              4, 9                 Return

             Addressing mode  Syntax               Description

              0               x/%x                 Register X
              1               [k]                  BHW at byte offset k in
          the packet
              2               [x + k]              BHW at the offset X + k
          in the packet
              3               M[k]                 Word at offset k in M[]
              4               #k                   Literal value stored in
          k
              5               4*([k]&0xf)          Lower nibble * 4 at byte
          offset k in the packet
              6               L                    Jump label L
              7               #k,Lt,Lf             Jump to Lt if true,
          otherwise jump to Lf
              8               #k,Lt                Jump to Lt if predicate
          is true
              9               a/%a                 Accumulator A
             10               extension            BPF extension (see next
          table)

             Extension (and alias)                 Description

             #len, len, #pktlen, pktlen            Length of packet
          (skb->len)
             #pto, pto, #proto, proto              Ethernet type field
          (skb->protocol)
             #type, type                           Packet type (**)
          (skb->pkt_type)
             #poff, poff                           Detected payload start
          offset
             #ifx, ifx, #ifidx, ifidx              Interface index
          (skb->dev->ifindex)
             #nla, nla                             Netlink attribute of
          type X with offset A
             #nlan, nlan                           Nested Netlink attribute
          of type X with offset A
             #mark, mark                           Packet mark (skb->mark)
             #que, que, #queue, queue, #Q, Q       NIC queue index
          (skb->queue_mapping)
             #hat, hat, #hatype, hatype            NIC hardware type (**)
          (skb->dev->type)
             #rxh, rxh, #rxhash, rxhash            Receive hash
          (skb->rxhash)
             #cpu, cpu                             Current CPU
          (raw_smp_processor_id())
             #vlant, vlant, #vlan_tci, vlan_tci    VLAN TCI value
          (vlan_tx_tag_get(skb))
             #vlanp, vlanp                         VLAN present
          (vlan_tx_tag_present(skb))

             Further extension details (**)        Value

             #type, type                           0 - to us / host
                                                   1 - to all / broadcast
                                                   2 - to group / multicast
                                                   3 - to others
          (promiscuous mode)
                                                   4 - outgoing of any type

             #hat, hat, #hatype, hatype            1 - Ethernet 10Mbps
                                                   8 - APPLEtalk
                                                  19 - ATM
                                                  24 - IEEE 1394 IPv4 - RFC
          2734
                                                  32 - InfiniBand
                                                 768 - IPIP tunnel
                                                 769 - IP6IP6 tunnel
                                                 772 - Loopback device
                                                 778 - GRE over IP
                                                 783 - Linux-IrDA
                                                 801 - IEEE 802.11
                                                 802 - IEEE 802.11 + Prism2
          header
                                                 803 - IEEE 802.11 +
          radiotap header
                                                 823 - GRE over IP6
                                                 824 - Netlink
                                                 [...] See
          include/uapi/linux/if_arp.h

          Note that the majority of BPF extensions are available on Linux
          only.

          There are two types of comments in bpfc source-files:

            1. Multi-line C-style comments:        /* put comment here */
            2. Single-line ASM-style comments:     ;  put comment here

          Used Abbreviations:

            BHW: byte, half-word, or word


-----------------------------------------------------------------------

::

          In this section, we give a couple of examples of bpfc source
          files, in other words, some small example filter programs:

          Only return packet headers (truncate packets):

            ld poff
            ret a

          Only allow ARP packets:

            ldh [12]
            jne #0x806, drop
            ret #-1
            drop: ret #0

          Only allow IPv4 TCP packets:

            ldh [12]
            jne #0x800, drop
            ldb [23]
            jneq #6, drop
            ret #-1
            drop: ret #0

          Only allow IPv4 TCP SSH traffic:

            ldh [12]
            jne #0x800, drop
            ldb [23]
            jneq #6, drop
            ldh [20]
            jset #0x1fff, drop
            ldxb 4 * ([14] & 0xf)
            ldh [x + 14]
            jeq #0x16, pass
            ldh [x + 16]
            jne #0x16, drop
            pass: ret #-1
            drop: ret #0

          A loadable x86_64 seccomp-BPF filter to allow a given set of
          syscalls:

            ld [4]                  /* offsetof(struct seccomp_data, arch)
          */
            jne #0xc000003e, bad    /* AUDIT_ARCH_X86_64 */
            ld [0]                  /* offsetof(struct seccomp_data, nr) */
            jeq #15, good           /* __NR_rt_sigreturn */
            jeq #231, good          /* __NR_exit_group */
            jeq #60, good           /* __NR_exit */
            jeq #0, good            /* __NR_read */
            jeq #1, good            /* __NR_write */
            jeq #5, good            /* __NR_fstat */
            jeq #9, good            /* __NR_mmap */
            jeq #14, good           /* __NR_rt_sigprocmask */
            jeq #13, good           /* __NR_rt_sigaction */
            jeq #35, good           /* __NR_nanosleep */
            bad: ret #0             /* SECCOMP_RET_KILL */
            good: ret #0x7fff0000   /* SECCOMP_RET_ALLOW */

          Allow any (hardware accelerated) VLAN:

            ld vlanp
            jeq #0, drop
            ret #-1
            drop: ret #0

          Only allow traffic for (hardware accelerated) VLAN 10:

            ld vlant
            jneq #10, drop
            ret #-1
            drop: ret #0

          More pedantic check for the above VLAN example:

            ld vlanp
            jeq #0, drop
            ld vlant
            jneq #10, drop
            ret #-1
            drop: ret #0

          Filter rtnetlink messages:

            ldh #proto       /* A = skb->protocol */

            jneq #0, skip    /* check for NETLINK_ROUTE */
            ldb [4]          /* A = nlmsg_type */

            jneq #0x10, skip /* check type == RTNL_NEWLINK */
            ldx #16          /* X = offset(ifinfomsg) */

            ldb [x + 4]      /* offset(ifi_index) */
            jneq #0x3, skip  /* check ifindex == 3 */

            ld #32           /* A = len(nlmsghdr) + len(ifinfomsg), payload
          offset */
            ldx #16          /* X = IFLA_OPERSTATE */
            ld #nla          /* A = offset(IFLA_OPERSTATE) */
            jeq #0, skip
            tax
            ldb [x + 4]      /* A = value(IFLA_OPERSTATE) */
            jneq #0x6, skip  /* check oper state is UP */

            ret #-1
            skip: ret #0


-------------------------------------------------------------------

::

          bpfc fubar
                 Compile the source file ''fubar'' into BPF opcodes.
                 Opcodes will be directed to stdout.

          bpfc -f xt_bpf -b -p -i fubar, resp. iptables -A INPUT -m bpf
          --bytecode `bpfc -f xt_bpf -i fubar` -j LOG
                 Compile the source file ''fubar'' into BPF opcodes, bypass
                 basic filter validation and emit opcodes in netfilter's
                 xt_bpf readable format. Note that the source file
                 ''fubar'' is first passed to the C preprocessor for
                 textual replacements before handing over to the bpfc
                 compiler.

          cat fubar | bpfc -
                 Read bpfc instruction from stdin and emit opcodes to
                 stdout.

          bpfc foo > bar && netsniff-ng -f bar ...
                 Compile filter instructions from file foo and redirect
                 bpfc's output into the file bar, that can then be read by
                 netsniff-ng(8) through option -f.

          bpfc -f tcpdump -i fubar
                 Output opcodes from source file fubar in the same behavior
                 as ''tcpdump -ddd''.


---------------------------------------------------

::

          bpfc is licensed under the GNU GPL version 2.0.


-------------------------------------------------------

::

          bpfc was originally written for the netsniff-ng toolkit by Daniel
          Borkmann. It is currently maintained by Tobias Klauser
          <tklauser@distanz.ch> and Daniel Borkmann
          <dborkma@tik.ee.ethz.ch>.


---------------------------------------------------------

::

          netsniff-ng(8), trafgen(8), mausezahn(8), ifpps(8), flowtop(8),
          astraceroute(8), curvetun(8)


-----------------------------------------------------

::

          Manpage was written by Daniel Borkmann.

COLOPHON
---------------------------------------------------------

::

          This page is part of the Linux netsniff-ng toolkit project. A
          description of the project, and information about reporting bugs,
          can be found at http://netsniff-ng.org/.

.. _colophon-top-1:

COLOPHON
---------------------------------------------------------

::

          This page is part of the netsniff-ng (a free Linux networking
          toolkit) project.  Information about the project can be found at
          ⟨http://netsniff-ng.org/⟩.  If you have a bug report for this
          manual page, send it to netsniff-ng@googlegroups.com.  This page
          was obtained from the project's upstream Git repository
          ⟨git://github.com/netsniff-ng/netsniff-ng.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-04-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux                         03 March 2013                      BPFC(8)

--------------

Pages that refer to this page:
`astraceroute(8) <../man8/astraceroute.8.html>`__, 
`curvetun(8) <../man8/curvetun.8.html>`__, 
`flowtop(8) <../man8/flowtop.8.html>`__, 
`ifpps(8) <../man8/ifpps.8.html>`__, 
`mausezahn(8) <../man8/mausezahn.8.html>`__, 
`netsniff-ng(8) <../man8/netsniff-ng.8.html>`__, 
`trafgen(8) <../man8/trafgen.8.html>`__

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
