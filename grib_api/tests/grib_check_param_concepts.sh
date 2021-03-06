#!/bin/sh
# Copyright 2005-2017 ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
# 
# In applying this licence, ECMWF does not waive the privileges and immunities granted to it by
# virtue of its status as an intergovernmental organisation nor does it submit to any jurisdiction.
#

. ./include.sh

REDIRECT=/dev/null

# This script will check the following concept files:
#   name.def paramId.def shortName.def units.def cfVarName.def
#
CHECK_DEFS=$ECCODES_DEFINITION_PATH/check_grib_defs.pl

defs_dirs="
 $ECCODES_DEFINITION_PATH/grib1
 $ECCODES_DEFINITION_PATH/grib2
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/ecmf
 $ECCODES_DEFINITION_PATH/grib2/localConcepts/ecmf

 $ECCODES_DEFINITION_PATH/grib1/localConcepts/ammc
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/eidb
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/ekmi
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/enmi
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/eswi
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/lfpw
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/lowm
 $ECCODES_DEFINITION_PATH/grib1/localConcepts/rjtd

 $ECCODES_DEFINITION_PATH/grib2/localConcepts/egrr
 $ECCODES_DEFINITION_PATH/grib2/localConcepts/ekmi
 $ECCODES_DEFINITION_PATH/grib2/localConcepts/eswi
 $ECCODES_DEFINITION_PATH/grib2/localConcepts/lfpw
"

for dir in $defs_dirs; do
  cd $dir
  $CHECK_DEFS
done
