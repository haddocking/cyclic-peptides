#!/bin/csh
#
  /home/abonvin/haddock2.4/tools/contact-chainID target.pdb 5 >target.contacts5
  /home/abonvin/haddock2.4/tools/contact-chainID target.pdb 10 >target.contacts10
  /home/abonvin/haddock2.4/tools/contact-chainID target.pdb 200 >target.contacts200
  /home/abonvin/haddock_git/haddock-CSB-tools/CAPRI_analysis/make_izone.csh target.contacts10 >tmp
  python2.7 /home/abonvin/haddock_git/haddock-CSB-tools/CAPRI_analysis/join_zones.py tmp >target.izone
  /home/abonvin/haddock_git/haddock-CSB-tools/CAPRI_analysis/make_izone.csh target.contacts200 >tmp
  python2.7 /home/abonvin/haddock_git/haddock-CSB-tools/CAPRI_analysis/join_zones.py tmp >tt
  grep "zone\ A" tt >target.lzone
  echo "fit" >>target.lzone
  grep "zone\ B" tt | sed -e 's/zone/rzone/g' >>target.lzone
  \rm tmp tt target.contacts200
