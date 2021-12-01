#!/bin/csh
#
source /home/abonvin/haddock2.4/haddock_configure.csh
set WDIR=/home/charitou/runs/3av9_complex/ana_scripts
set refe=$WDIR/target.pdb
#
# Define the location of dockQ
#
setenv DOCKQ /home/abonvin/haddock_git/DockQ-fortran-code/DockQ/DockQ.exe

echo "#stucture Fnat L-RMSD i-RMSD DockQ CAPRIquality DockQquality" >DockQ.dat

foreach i (`cat file.nam`)
  if ( -e $i.gz ) then
    gzip -dc $i.gz > $i:t:r.tmp2
  else
    \cp $i $i:t:r.tmp2
  endif
  $HADDOCKTOOLS/pdb_segid-to-chain $i:t:r.tmp2 |sed -e 's/BB/CA/' >$i:t:r.tmp1
  echo $i |awk '{printf "%s ", $1}' >>DockQ.dat
  $DOCKQ $i:t:r.tmp1 $refe >tmp
  grep Fnat= tmp| awk '{printf "%s %s %s %s ", $2,$4,$6,$8}' >>DockQ.dat
  grep CAPRI tmp| grep fnat | awk '{printf "%s ", $NF}' >>DockQ.dat
  grep CAPRI tmp| grep Dock | awk '{print $NF}' >>DockQ.dat
  \rm $i:t:r.tmp1
  \rm $i:t:r.tmp2
  \rm tmp
end
