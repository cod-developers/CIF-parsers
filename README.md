Comparison of Crystallographic Information Format v1.1 and v2.0 parsers
=======================================================================

Various parsers for Crystallographic Information Format (CIF) v1.1 and
v2.0 are compared as continuation of research published in
[Merkys et al. 2016](http://scripts.iucr.org/cgi-bin/paper?po5052).
Original purpose of this research is to find out the differences in
reactions of various CIF parsers while parsing curious cases of both
valid and erroneous CIF files.

Tested CIF v1.1 parsers
-----------------------

* [Atomic Simulation Environment (ASE)](http://wiki.fysik.dtu.dk/ase)
* [cif2cif](http://doi.org/10.1107/S0021889896006371)
* [CIF API](https://github.com/COMCIFS/cif_api)
* [COD::CIF::Parser of cod-tools](http://wiki.crystallography.net/cod-tools/)
* [PyCIFRW](https://bitbucket.org/jamesrhester/pycifrw/)
* [STAR::Parser](http://pdb.sdsc.edu/STAR/index.html)
* [ucif](http://doi.org/10.1107/S0021889811041161)
* [vcif and vcif2](http://www.iucr.org/resources/cif/software/archived/vcif-1.2)
* [ZINC](http://www.iucr.org/__data/iucr/cif/software/zinc/doc/zinc-paper.pdf)

Parsers to be tested:

* [mmCIF parser](https://github.com/gjbekker/cif-parsers)

Tested CIF v2.0 parsers
-----------------------

* [COD::CIF::Parser of cod-tools](http://wiki.crystallography.net/cod-tools/)
* [PyCIFRW](https://bitbucket.org/jamesrhester/pycifrw/)

Parsers to be tested:

* [CIF API](https://github.com/COMCIFS/cif_api)

Structure
---------

Drivers for parsers are located at [1.1/drivers/](1.1/drivers/) and
[2.0/drivers/](2.0/drivers/). Tests are located at 
[1.1/tests/](1.1/tests/) and [2.0/tests/](2.0/tests/). Tables with the
results are located in relative ``outputs/table.tex`` and
``outputs/table.html`` files.

Reporting and Contribution
--------------------------

Bug reports and contributions are welcome.
