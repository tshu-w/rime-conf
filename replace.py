#!/usr/bin/env python
from pathlib import Path

def replace_letters(input_text):
    original_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    replacement_letters = "ᴀʙᴄᴅᴇғɢʜɪᴊᴋʟᴍɴᴏᴘǫʀsᴛᴜᴠᴡxʏᴢ"
    translation_table = str.maketrans(original_letters, replacement_letters)
    modified_text = input_text.translate(translation_table)
    return modified_text

for f in Path('.').glob('*.schema.yaml'):
    with f.open('r') as file:
        content = file. read()
        modified_content = replace_letters(content)

    with f.open('w') as file:
        file.write(modified_content)
