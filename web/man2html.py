#!/usr/bin/env python3
from textwrap import dedent
from pathlib import Path
import subprocess
import argparse
import sys
import re

class ManHTML:
    def __init__(self, resource):
        self.resource = resource
        self.html = ""

    def get_manhtml(self):
        cmd = ["man", "-Thtml", self.resource]
        p = subprocess.run(cmd, capture_output=True, text=True)
        if p.stdout:
            self.html = p.stdout
        else:
            raise ValueError(f"No stdout for {cmd.join(' ')}")

    def replace_head(self):
        new_head = dedent(f'''<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../../css/style.css">
  <title>{self.resource.upper()}</title>
</head>''')
        
        head_pattern = re.compile(r"<head\b[^>]*>.*?</head>", flags=re.I | re.S)
        new_html = head_pattern.sub(new_head, self.html, count=1)
        if new_html:
            self.html = new_html    
        else:
            raise ValueError("No New HTML.")
 
    def insert_link(self):
        lines = self.html.splitlines()

        insert_index = None
        h1_pattern = re.compile(r"<h1[^>]*>.*?</h1>")

        for index, line in enumerate(lines):
            m = h1_pattern.search(line)
            if m:
                insert_index = index + 1
                break
        if not m:
            sys.exit(f"No matches found in h1 block")

        new_line = '\n<a href="../../">Go Back to Man pages</a>'
        self.html = "\n".join(lines[:insert_index] + [new_line] + lines[insert_index:])

    def write_html(self, directory=None):
        if directory:
            with open(f"{directory}/{self.resource}.html", "w") as f:
                f.write(self.html)
                print(f"Written to {directory}/{self.resource}.html")
        elif Path(f"/srv/www/man/{self.resource[0].upper()}").is_dir():
            with open(f"/srv/www/man/{self.resource[0].upper()}/{self.resource}.html", "w") as f:
                f.write(self.html)
                print(f"Written to /srv/www/man/{self.resource[0].upper()}/{self.resource}.html")
        else:
            with open(f"{self.resource}.html", "w") as f:
                f.write(self.html)
                print(f"Written to {self.resource}.html")

    def convert_to_html(self, directory=None):
        self.get_manhtml()
        self.replace_head()
        self.insert_link()
        self.write_html(directory=directory)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("resource")
    p.add_argument("-d", "--dir")
    args = p.parse_args()

    manpage = ManHTML(args.resource)
    manpage.convert_to_html()

if __name__ == "__main__":
    main()


