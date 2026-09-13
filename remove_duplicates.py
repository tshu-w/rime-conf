#!/usr/bin/env python

import os
import filecmp
from pathlib import Path

for f in Path(".").rglob("*"):
    splits = f.stem.rsplit(" ", maxsplit=-1)
    if len(splits) > 1 and splits[1].isnumeric():
        orig_f = f.with_stem(splits[0])
        if orig_f.exists() and (
            (os.path.isfile(f) and filecmp.cmp(f, orig_f))
            or (os.path.isdir(f) and not filecmp.dircmp(f, orig_f).diff_files)
        ):
            print(orig_f, f)
            os.system(f'trash "{f.resolve()}"')
