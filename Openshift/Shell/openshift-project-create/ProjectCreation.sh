#!/bin/bash
source Scripts/EmptyProject.sh
source Scripts/LabelProvider.sh
source Scripts/QuotaLimit.sh
source Scripts/RoleBindings.sh

#### Function for Project Creation ####
readProjectProperties $1

#### Function for Labels Creation ####
readLabelsProperties $1

#### Function for Quota Creation ####
readQoutaLimitsProperties $1

#### Function for Roles Creation ####
readRoleProperties $1