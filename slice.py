#!/usr/bin/env python3

import yaml
import sys


print(sys.argv)

config_file = sys.argv[1]

with open(config_file, 'r') as cfgf:
    try:
        cfg = yaml.safe_load(cfgf)
        print(cfg)
    except yaml.YAMLError as exc:
        print(exc)
        
        
