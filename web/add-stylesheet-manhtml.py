#!/usr/bin/env python3
import re
import argparse
from pathlib import Path

def replace_head(html_file: str):
    new_head = '''<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../00-styles.css">
</head>'''
    
    html = Path(html_file)
    text = html.read_text()
    head_pattern = re.compile(r"<head>.*</head>", flags=re.S)
    new_text = head_pattern.sub(new_head, text)
    
    html.write_text(new_text)    

def main():
    p = argparse.ArgumentParser()
    p.add_argument("file")
    args = p.parse_args()

    replace_head(args.file)

if __name__ == "__main__":
    main()
    
