﻿







$bytes = [System.Convert]::FromBase64String($dll)
$rsat = [System.Reflection.Assembly]::Load($bytes)
import-module -Assembly $rsat